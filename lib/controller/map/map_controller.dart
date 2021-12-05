import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'package:e_space_mobile/base/base_controller.dart';
import 'package:e_space_mobile/core/theme/app_colors.dart';
import 'package:e_space_mobile/data/models/area/statuses/statuses_response.dart';
import 'package:e_space_mobile/data/models/home/entity/entity_model_response.dart';
import 'package:e_space_mobile/data/models/home/suggestion/address/city_model_response.dart';
import 'package:e_space_mobile/data/models/home/suggestion/address/district_model_response.dart';
import 'package:e_space_mobile/data/repository/map_repository.dart';
import 'package:e_space_mobile/ui/main/area/widgets/filter_item_widget.dart';
import 'package:e_space_mobile/ui/main/map/map/google_map_page.dart';
import 'package:e_space_mobile/ui/main/map/map/widgets/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart' as LOCATORSERVICE;
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:maps_toolkit/maps_toolkit.dart' as MapToolKit;

class MapController extends BaseController {
  late final MapRepository _mapRepository;

  MapController() {
    _mapRepository = MapRepository();
  }
  ///TODO  need add ios map key for ios
  final apiKey = 'AIzaSyDJOP1j8alA43iBHjxkhchQmc_ZIze5eJc';
  bool _showStart = false;
  bool _showMove = false;
  bool _kIsStart = false;
  bool _kIsEnd = false;
  bool _showBottomSheetTool = false;
  MapType _mapType = MapType.normal;

  // filter fields for use filter polygon
  final FilteredFields? filteredFields =
  (Get.arguments is FilteredFields) ? Get.arguments : null;

  GoogleMapController? _mapController;
  List<LocationData> currentPoints = [];

  CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(41.311081, 69.240562),
    zoom: 16,
  );

  // for permissions below 4
  Location location = Location();
  bool serviceEnabled = false;
  PermissionStatus? permissionStatus;

  LocationData? locationData;

  // Completer<GoogleMapController> _controller = Completer();
  Set<Polyline> polyline = HashSet<Polyline>();
  Set<Polygon> polygon = HashSet<Polygon>();
  Set<Marker> markers = HashSet<Marker>();

  List<LatLng> pointList = <LatLng>[];
  double radius = 100;
  int polygonIdCounter = 1;
  int markerIdCounter = 1;

  bool isPolygon = false;
  bool isMarker = false;
  // for gps function switch order and sign button
  bool _switchForOrderAndGpsButton = true;
  bool get switchForOrderAndGpsButton => _switchForOrderAndGpsButton;

  bool _isDoneButtonVisible = false;
  bool get isDoneButtonVisible => _isDoneButtonVisible;

  void setDoneButtonVisibleValue() {
    _isDoneButtonVisible = true;
    update();
  }

  void setSwitchForOrderAndGps(bool value){
    _switchForOrderAndGpsButton = value;
    update();
  }

  // viloyat
  List<Cities> _cities = [];
  List<Cities> get cities => _cities;
  List<String> citiesName = [];
  Cities? _selectedCity;
  Cities? get selectedCity => _selectedCity;

  //tuman
  List<Regions> _regions = [];
  List<Regions> get regions => _regions;
  List<String> regionsName = [];
  Regions? _selectedRegion;
  Regions? get selectedRegion => _selectedRegion;

  List<Statuses> _statuses = [];
  List<Statuses> get statuses => _statuses;
  List<CheckAndValue> statusesName = [];
  Statuses? _selectedStatus;
  Statuses? get selectedStatus => _selectedStatus;
  int _statusCount = 0;
  int get statusCount => _statusCount;
  RxInt areaSquare = 0.obs;

  bool _isVisible = false;
  bool _isVisibleRegion = false;
  bool _isVisibleStatus = false;

  bool get isVisibleRegion => _isVisibleRegion;
  bool get isVisible => _isVisible;
  bool get isVisibleStatus => _isVisibleStatus;

  List<Entities> _entities = [];
  List<Entities> get entities => _entities;

  @override
  void onInit() {
    super.onInit();
    // if(filteredFields ==null){
      checkLocationPermissions();
    // }
  }

  // draw marker for map according to latLang;
  void setMarker(LatLng point) async {
    markerIdCounter++;
    final String markerIdVal = 'marker_id_$markerIdCounter';
    final icon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5, size: Size(5, 5)),
        "assets/png/marker.png");
    markers.add(Marker(
      markerId: MarkerId(markerIdVal),
      position: point,
      icon: icon,
    ));
    update();
  }

  void clearMarkers() {
    markers.clear();
  }

  void clearPolygon() {
    polygon.clear();
    pointList.clear();
    areaSquare.value = 0;
    update();
  }

  void setPolygonPoints(LatLng points) {
    pointList.add(points);
    if (pointList.length > 2) {
      _isGreen = true;
    } else {
      _isGreen = false;
    }
    setMarker(points);
  }

  // draw polygon like shapes according to lat lang;
  void setPolygon() {
    final String polygonIdVal = 'polygon_id_$polygonIdCounter';
    polygonIdCounter++;
    polygon.add(Polygon(
        polygonId: PolygonId(polygonIdVal),
        points: pointList,
        strokeWidth: 2,
        strokeColor: AppColors.blue,
        onTap: () {
          int area = areaPolygon(pointList);
          Get.snackbar('Message', area.toString() + ' Сотик');
        },
        fillColor: AppColors.gradientBlue.withOpacity(0.1),
        consumeTapEvents: true,
        geodesic: false,
        visible: true));
    areaSquare.value = areaPolygon(pointList);
    update();
  }

  void setPolygonWithoutUpdate() {
    if(pointList.isEmpty) return;
    final String polygonIdVal = 'polygon_id_$polygonIdCounter';
    polygonIdCounter++;
    polygon.add(Polygon(
        polygonId: PolygonId(polygonIdVal),
        points: pointList,
        strokeWidth: 2,
        strokeColor: AppColors.blue,
        onTap: () {
          int area = areaPolygon(pointList);
          Get.snackbar('Message', area.toString() + ' Сотик');
        },
        fillColor: AppColors.gradientBlue.withOpacity(0.1),
        consumeTapEvents: true,
        geodesic: false,
        visible: true));
    areaSquare.value = areaPolygon(pointList);
  }

  // check user current position and move camera position to that point;
  void checkLocationPermissions() async {
    bool serviceEnabled;
    LOCATORSERVICE.LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await LOCATORSERVICE.Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await LOCATORSERVICE.Geolocator.checkPermission();
    if (permission == LOCATORSERVICE.LocationPermission.denied) {
      permission = await LOCATORSERVICE.Geolocator.requestPermission();
      if (permission == LOCATORSERVICE.LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LOCATORSERVICE.LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    LOCATORSERVICE.Position position = await LOCATORSERVICE.Geolocator.getCurrentPosition(
        desiredAccuracy: LOCATORSERVICE.LocationAccuracy.bestForNavigation,
      timeLimit: Duration(seconds: 2)
    );

    _mapController?.moveCamera(
        CameraUpdate.newLatLngZoom(
            LatLng(
                position.latitude ,
                position.longitude),
            20)
    );

 LOCATORSERVICE.Geolocator.
    getPositionStream(
      desiredAccuracy: LOCATORSERVICE.LocationAccuracy.bestForNavigation,
      distanceFilter: 1
    ).listen(
            (LOCATORSERVICE.Position position) {
              if (_kIsStart && !_kIsEnd) {
                pointList.add(
                    LatLng(
                        position.latitude,
                        position.longitude)
                );
                polyline.clear();
                polyline.add(
                    Polyline(
                    polylineId: PolylineId("foot_polyline"),
                    points: pointList,
                    width: 3,
                    color: AppColors.blue,
                    onTap: () {
                      areaSquare.value = areaPolygon(pointList);
                      Get.snackbar('Message', areaSquare.value.toString());
                    },
                    consumeTapEvents: true,
                    geodesic: true,
                    visible: true));
                update();
              }
              print(position == null ? 'Unknown' : position.latitude.toString() + ', ' + position.longitude.toString());
        });


    /*serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }
    permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
      if (permissionStatus != PermissionStatus.granted) {
        return;
      }
    }

    location.changeSettings(accuracy: LocationAccuracy.high);
    locationData = await location.getLocation();
    _mapController?.moveCamera(
        CameraUpdate.newLatLngZoom(
        LatLng(
            locationData?.latitude ?? 0.0,
            locationData?.longitude ?? 0.0),
            20)
    );
    location.onLocationChanged.listen((LocationData currentLocation) {
      print('${currentLocation.latitude} ===== ${currentLocation.longitude}');
      if (_kIsStart && !_kIsEnd) {
        pointList.add(
            LatLng(
                currentLocation.latitude ?? 0.0,
                currentLocation.longitude ?? 0.0));
        polyline.clear();
        polyline.add(Polyline(
            polylineId: PolylineId("foot_polyline"),
            points: pointList,
            width: 3,
            color: AppColors.blue,
            onTap: () {
              areaSquare.value = areaPolygon(pointList);
              Get.snackbar('Message', areaSquare.value.toString());
            },
            consumeTapEvents: true,
            geodesic: true,
            visible: true));
        update();
      }
    });*/
  }

  void changeStart(bool v) {
    _showStart = v;
    update();
  }

  void changeMove(bool v) {
    _showMove = v;
    _showStart = false;
    update();
  }

  void showBottomSheet() {
    if (isPolygon) {
      _showStart = false;
      _showBottomSheetTool = true;
      update();
    }
  }

  bool get showStart => _showStart;
  bool get showMove => _showMove;
  bool get showBottomSheetTool => _showBottomSheetTool;

  // used in gps polygon draw to show the first point of user;
  void addPoint() async {
    if (!_kIsEnd) {
      final locationData = await location.getLocation();
      pointList.add(
          LatLng(locationData.latitude ?? 0.0, locationData.longitude ?? 0.0));
      markerIdCounter++;
      final String markerIdVal = 'marker_id_$markerIdCounter';
      final icon = await BitmapDescriptor.fromAssetImage(
          ImageConfiguration(devicePixelRatio: 2.5), "assets/png/marker.png");
      markers.add(Marker(
          markerId: MarkerId(markerIdVal),
          position: LatLng(
              locationData.latitude ?? 0.0, locationData.longitude ?? 0.0),
          icon: icon));
      currentPoints.add(locationData);
      if (currentPoints.length > 1) {
        polyline.clear();
        pointList.clear();
        update();
        currentPoints.forEach((element) {
          pointList.add(LatLng(element.latitude ?? 0.0, element.longitude ?? 0.0));
        });
        polyline.add(Polyline(
          polylineId: PolylineId("foot_polyline"),
          points: pointList,
          width: 3,
          color: AppColors.blue,
          consumeTapEvents: true,
          geodesic: true,
          visible: true,
        ));
      } else {
        _kIsStart = true;
      }
      update();
    }
  }

  // this func used to sign last point of user which using gps function on map
  void endPoint() async {
    final locationData = await location.getLocation();
    markerIdCounter++;
    final String markerIdVal = 'marker_id_$markerIdCounter';
    final icon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5), "assets/png/marker.png");
    markers.add(Marker(
        markerId: MarkerId(markerIdVal),
        position: LatLng(
            locationData.latitude ?? 0.0,
            locationData.longitude ?? 0.0),
        icon: icon));
    currentPoints.add(locationData);
    polyline.clear();
    // pointList.clear();
    polygon.clear();
    currentPoints.forEach((element) {
      pointList.add(LatLng(element.latitude ?? 0.0, element.longitude ?? 0.0));
    });
    polygon.add(
      Polygon(
          polygonId: PolygonId("foot_polygon"),
          points: pointList,
          strokeWidth: 3,
          strokeColor: AppColors.blue,
          consumeTapEvents: true,
          onTap: () {
            int area = areaPolygon(pointList);
            Get.snackbar('Message', area.toString() + ' Сотик');
          },
          fillColor: AppColors.blue.withOpacity(0.1),
          geodesic: true,
          visible: true
      ),
    );
    _kIsStart = false;
    _kIsEnd = true;
    update();
  }

  bool _isGreen = false;
  bool get isGreen => _isGreen;

  void activeGreenButton(bool activate) {
    _isGreen = activate;
    _showBottomSheetTool = true;
    _isDoneButtonVisible = true;
  }

  void polygonArea() {
    areaSquare.value = areaPolygon(pointList);
    _isGreen = true;
  }

  void setGoogleMapController(GoogleMapController controller) {
    _mapController = controller;
  }

  GoogleMapController? get mapController => _mapController;

  MapType get mapType => _mapType;

  void setMapType(MapTypeEnum type) {
    if (type == MapTypeEnum.normal) {
      _mapType = MapType.normal;
    } else {
      _mapType = MapType.hybrid;
    }
    update();
  }

  // used to remove last point of polygon and redraw it;
  void removePolygonLastPoint() {
    LatLng lastPoint = pointList.removeLast();
    polygon.clear();
    if (pointList.length < 3) {
      _isGreen = false;
    }
    markers.removeWhere((element) => element.position == lastPoint);
    setPolygon();
  }

  // used to remove last point of polygon and redraw it again;
  void removeLastPoint() async {
    if (currentPoints.length > 1) {
      final index = pointList.indexOf(LatLng(currentPoints.last.latitude ?? 0.0,
          currentPoints.last.longitude ?? 0.0));
      final lastPoint = pointList.last;
      pointList.removeRange(index, pointList.length);
      currentPoints.removeLast();
      markers.removeWhere((element) =>
          element.markerId == MarkerId("marker_id_$markerIdCounter"));
      polyline.clear();
      pointList.add(lastPoint);
      polyline.add(Polyline(
          polylineId: PolylineId("foot_polyline"),
          points: pointList,
          width: 3,
          color: AppColors.blue,
          consumeTapEvents: true,
          geodesic: true,
          visible: true));
      update();
    }
  }

  // used to hide/show list of cities;
  void updateVisibility() async {
    _isVisible = !_isVisible;
    update();
  }

  // used to hide/show list of regions;
  void updateVisibilityRegion() {
    if (_selectedCity != null) {
      _isVisibleRegion = !_isVisibleRegion;
      update();
    }
  }

  // used to hide/show list of status;
  void updateVisibilityStatus() {
    _isVisibleStatus = !_isVisibleStatus;
    update();
  }

  // viloyat , set selected city to filter
  void setRegion(int index) async {
    _selectedCity = _cities[index];
    // await getDistricts(_selectedCity?.id ?? '');
    // await getEntitiesByFilter();
  }

  // tuman ,set selected region to filter
  void setDistrict(int index) async {
    _selectedRegion = _regions[index];
    update();
    // await getEntitiesByFilter();
  }

  Future<void> addAllPoints(List<LatLng> points) async {
    if (points.isNotEmpty) {
      kGooglePlex = CameraPosition(
        target: points.last,
        zoom: 16,
      );
      pointList.clear();
      pointList.addAll(points);
      pointList.forEach((element) {
        setMarker(element);
      });
    }
  }

  // status ,set selected status to filter
  void setStatuses(int index) async {
    _selectedStatus = _statuses[index];
    if (!statusesName[index].isCheck) {
      _statusCount++;
    } else {
      _statusCount--;
    }
    statusesName[index].isCheck = !statusesName[index].isCheck;
    update();
  }

  // get polygons from backed according to selected filter and draw it;
  Future<List<Entities>> getEntitiesByFilter(
      FilteredFields? filteredField) async {
    polygon.clear();
    markers.clear();
    String cityId = filteredField?.cityId ?? '';
    String regionId = filteredField?.regionId ?? '';
    String statusId = filteredField?.statusId ?? '';
    setLoading(true);
    var response = await _mapRepository.getEntityWithOptions(
      cityId,
      regionId,
      statusId,
    );
    setLoading(false);
    if (response is EntityModelResponse) {
      _entities = response.entities ?? [];
      pointList.clear();
      String id = '6113589b73bf6fe15aaef566';
      _entities.forEach((element) {
        element.entityProperties?.forEach((data) {
          if (data.propertyId == id && data.value != null) {
            String value = data.value ?? '';
            List<LatLng> latLang = [];
            List<dynamic> list = json.decode(value);
            list.first.forEach((data) {
              latLang.add(
                  LatLng(
                  double.parse(data[1].toString()),
                  double.parse(data[0].toString()))
              );
            });
            createPolygon(element, latLang);
          }
        });
      });
      moveCamera();
    } else {
      showErrorMessage(response.toString());
    }
    return _entities;
  }

  // draw polygon according to polygon come from backend lat lang;
  void createPolygon(Entities entities, List<LatLng> list) {
    if (list.isNotEmpty) {
      kGooglePlex = CameraPosition(
        target: list.first,
        zoom: 16,
      );
    }
    _mapController?.moveCamera(CameraUpdate.newCameraPosition(kGooglePlex));
    final String polygonIdVal = entities.id ?? '';
    polygon.add(
        Polygon(polygonId: PolygonId(polygonIdVal),
        points: list,
        strokeWidth: 3,
        strokeColor: AppColors.blue,
        onTap: () {
          int area = areaPolygon(list);
          Get.snackbar('Message', area.toString() + ' Сотик');
          entities.areaOfSurface = area;
          showPolygonInfoDialog(entities);
        },
        fillColor: AppColors.blue.withOpacity(0.1),
        consumeTapEvents: true,
        geodesic: true,
        visible: true));
    // moveCamera();
    // update();
  }

  int areaPolygon(List<LatLng> pointList) {
    List<MapToolKit.LatLng> list = [];
    pointList.forEach((element) {
      list.add(MapToolKit.LatLng(element.latitude, element.longitude));
    });
    int area = MapToolKit.SphericalUtil.computeArea(list).toInt();
    return area;
  }

  void moveCamera() {
    _mapController?.
    moveCamera(CameraUpdate.newLatLngZoom(kGooglePlex.target, 16));
    update();
  }

}

enum MapTypeEnum {
  normal,
  hybrid,
}
