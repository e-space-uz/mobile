
import 'dart:collection';
import 'dart:convert';
import 'package:e_space_mobile/base/base_controller.dart';
import 'package:e_space_mobile/core/theme/app_colors.dart';
import 'package:e_space_mobile/data/models/area/statuses/statuses_response.dart';
import 'package:e_space_mobile/data/models/home/suggestion/address/city_model_response.dart';
import 'package:e_space_mobile/data/models/home/suggestion/address/district_model_response.dart';
import 'package:e_space_mobile/data/repository/map_repository.dart';
import 'package:e_space_mobile/ui/main/area/widgets/filter_item_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MainMapController extends BaseController {
  late final MapRepository _mapRepository;

  MainMapController() {
    _mapRepository = MapRepository();
  }

  /// need add ios map key for ios
  final apiKey = 'AIzaSyDJOP1j8alA43iBHjxkhchQmc_ZIze5eJc';
  bool _kIsStart = false;
  bool _kIsEnd = false;
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

  bool isPolygon = true;
  bool isMarker = false;

  // below filter items
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

  bool _isVisible = false;
  bool _isVisibleRegion = false;
  bool _isVisibleStatus = false;

  bool get isVisibleRegion => _isVisibleRegion;
  bool get isVisible => _isVisible;
  bool get isVisibleStatus => _isVisibleStatus;

  @override
  void onInit() {
    super.onInit();
    checkLocationPermissions();
  }

  onReady() async {
    super.onReady();
    getCities();
    await getAllStatuses();
  }

  updateVisibility() async {
    _isVisible = !_isVisible;
    update();
  }

  updateVisibilityRegion() {
    if (_selectedCity != null) {
      _isVisibleRegion = !_isVisibleRegion;
      update();
    }
  }

  updateVisibilityStatus() {
    _isVisibleStatus = !_isVisibleStatus;
    update();
  }

  // viloyat
  setRegion(int index) async {
    _selectedCity = _cities[index];
    _selectedRegion = null;
    regionsName.clear();
    await getDistricts(_selectedCity?.id ?? '');
  }

  // tuman
  setDistrict(int index) async {
    _selectedRegion = _regions[index];
    update();
  }

  // status
  setStatuses(int index) async {
    _selectedStatus = _statuses[index];
    if (!statusesName[index].isCheck) {
      _statusCount++;
    } else {
      _statusCount--;
    }
    statusesName[index].isCheck = !statusesName[index].isCheck;
    update();
  }

  void setMarker(LatLng point) {
    final String markerIdVal = 'marker_id_$markerIdCounter';
    markerIdCounter++;
    markers.add(Marker(markerId: MarkerId(markerIdVal), position: point));
    update();
  }

  void clearMarkers() {
    markers.clear();
  }

  void clearPolygon() {
    polygon.clear();
    pointList.clear();
    update();
  }

  void setPolygonPoints(LatLng points) {
    pointList.add(points);
  }

  void setPolygon() {
    final String polygonIdVal = 'polygon_id_$polygonIdCounter';
    polygon.add(Polygon(
        polygonId: PolygonId(polygonIdVal),
        points: pointList,
        strokeWidth: 3,
        strokeColor: AppColors.blue,
        fillColor: AppColors.blue.withOpacity(0.1),
        consumeTapEvents: true,
        geodesic: true,
        visible: true));
    update();
  }

  Set<Polygon> createPolygonByPoint(List<LatLng> points) {
    final String polygonIdVal = 'polygon_id_q100';
    Set<Polygon> polygon = HashSet<Polygon>();
    if (points.isNotEmpty) {
      kGooglePlex = CameraPosition(
        target: LatLng(points.first.latitude, points.first.longitude),
        zoom: 17.0,
      );
      polygon.add(Polygon(
          polygonId: PolygonId(polygonIdVal),
          points: points,
          strokeWidth: 3,
          strokeColor: AppColors.blue,
          fillColor: AppColors.blue.withOpacity(0.1),
          consumeTapEvents: true,
          geodesic: true,
          visible: true));
    }
    return polygon;
  }

  Set<Polygon> createPolygonByValue(String value) {
    List<LatLng> latLang = [];
    List<dynamic> list = json.decode(value);
    if (list.isNotEmpty) {
      list.first.forEach((data) {
        latLang.add(LatLng(double.parse(data[1].toString()),
            double.parse(data[0].toString())));
      });
    }
    final String polygonIdVal = 'polygon_id_q100';
    Set<Polygon> polygon = HashSet<Polygon>();
    if (latLang.isNotEmpty) {
      kGooglePlex = CameraPosition(
        target: LatLng(latLang.first.latitude, latLang.first.longitude),
        zoom: 18.0,
      );
      polygon.add(Polygon(
          polygonId: PolygonId(polygonIdVal),
          points: latLang,
          strokeWidth: 3,
          strokeColor: AppColors.blue,
          fillColor: AppColors.blue.withOpacity(0.1),
          consumeTapEvents: true,
          geodesic: true,
          visible: true));
    }
    return polygon;
  }

  void setNewPositionByValue(String value) {
    List<LatLng> latLang = [];
    List<dynamic> list = json.decode(value);
    if (list.isNotEmpty) {
      list.first.forEach((data) {
        latLang.add(LatLng(double.parse(data[1].toString()),
            double.parse(data[0].toString())));
      });
    }
    if (latLang.isNotEmpty)
      kGooglePlex = CameraPosition(
        target: LatLng(latLang.first.latitude, latLang.first.longitude),
        zoom: 17.0,
      );
  }

  void setNewPosition(List<LatLng> points) {
    if (points.isNotEmpty)
      kGooglePlex = CameraPosition(
        target: LatLng(points.first.latitude, points.first.longitude),
        zoom: 17,
      );
  }

  void checkLocationPermissions() async {
    serviceEnabled = await location.serviceEnabled();
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
    location.changeSettings(accuracy: LocationAccuracy.high,interval: 2000,distanceFilter: 1);

    locationData = await location.getLocation();
    _mapController?.moveCamera(
        CameraUpdate.newLatLngZoom(
        LatLng(locationData?.latitude ?? 0.0, locationData?.longitude ?? 0.0),
            20));
    location.onLocationChanged.listen((LocationData currentLocation) {
      if (_kIsStart && !_kIsEnd) {
        pointList.add(LatLng(
            currentLocation.latitude ?? 0.0, currentLocation.longitude ?? 0.0));
        polyline.clear();
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
    });
  }

  setGoogleMapController(GoogleMapController controller) {
    _mapController = controller;
  }

  GoogleMapController? get mapController => _mapController;

  Future<void> getCities() async {
    setLoading(true);
    var response = await _mapRepository.getCities();
    setLoading(false);
    if (response is CityModelResponse) {
      _cities = response.cities ?? [];
      citiesName.clear();
      _cities.forEach((element) {
        citiesName.add(element.name ?? '');
      });
      update();
    } else {
      showErrorMessage(response.toString());
    }
  }

  Future<void> getAllStatuses() async {
    setLoading(true);
    var response = await _mapRepository.getAllStatuses(1, 150);
    setLoading(false);
    if (response is StatusesResponse) {
      _statuses = response.statuses ?? [];
      statusesName.clear();
      _statuses.forEach((element) {
        statusesName
            .add(CheckAndValue(title: element.name ?? '', isCheck: false));
      });
      update();
    } else {
      showErrorMessage(response.toString());
    }
  }

  Future<void> getDistricts(String cityId) async {
    setLoading(true);
    var response = await _mapRepository.getDistricts(cityId);
    setLoading(false);
    if (response is DistrictModelResponse) {
      _regions = response.regions ?? [];
      regionsName.clear();
      _regions.forEach((element) {
        regionsName.add(element.name ?? '');
      });
      update();
    } else {
      showErrorMessage(response.toString());
    }
  }
}
