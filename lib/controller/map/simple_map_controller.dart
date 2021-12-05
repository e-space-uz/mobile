import 'dart:collection';
import 'dart:convert';
import 'package:e_space_mobile/base/base_controller.dart';
import 'package:e_space_mobile/core/theme/app_colors.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class SimpleMapController extends BaseController {

  final apiKey = 'AIzaSyDJOP1j8alA43iBHjxkhchQmc_ZIze5eJc';
  GoogleMapController? _mapController;

  List<LocationData> currentPoints = [];

   CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(41.311081, 69.240562),
    zoom: 16,
  );
  MapType _mapType = MapType.normal;

  Set<Polyline> polyline = HashSet<Polyline>();
  Set<Polygon> polygon = HashSet<Polygon>();
  Set<Marker> markers = HashSet<Marker>();

  List<LatLng> pointList = <LatLng>[];
  int polygonIdCounter = 1;
  int markerIdCounter = 1;

  bool isPolygon = true;
  bool isMarker = false;

  void setMarker(LatLng point) {
    final String markerIdVal = 'marker_id_$markerIdCounter';
    markerIdCounter++;
    markers.add(
        Marker(
            markerId: MarkerId(markerIdVal),
            position: point));
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
        visible: true)
    );
    update();
  }

  CameraPosition getNewCameraPosition(List<LatLng> points){
    if(points.isNotEmpty){
      return CameraPosition(
        target: LatLng(points.first.latitude,points.first.longitude),
        zoom: 16,
      );
    }
    return kGooglePlex;
  }

  Set<Polygon> createPolygonByPoint(List<LatLng> points) {
    final String polygonIdVal = 'polygon_id_q100';
    Set<Polygon> polygon = HashSet<Polygon>();
    if(points.isNotEmpty){
      kGooglePlex =  CameraPosition(
        target: LatLng(
            points.first.latitude,
            points.first.longitude),
        zoom: 17.0,
      );
      polygon.add(
          Polygon(
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

  void createPolygonByValue(String value) {
    List <LatLng> latLang = [];
    List<dynamic> list = json.decode(value);
    list.first.forEach((data){
      latLang.add(
          LatLng(
              double.parse(data[1].toString()),
              double.parse(data[0].toString())
          ));
    });
    final String polygonIdVal = 'polygon_id_q100';
    if(latLang.isNotEmpty){
      kGooglePlex =  CameraPosition(
        target: LatLng(latLang.first.latitude,latLang.first.longitude),
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
    update();
  }

  void setNewPositionByValue(String value){
    List <LatLng> latLang = [];
    List<dynamic> list = json.decode(value);
    list.first.forEach((data){
      latLang.add(
          LatLng(
              double.parse(data[1].toString()),
              double.parse(data[0].toString())
          ));
    });
    kGooglePlex =  CameraPosition(
      target: LatLng(latLang.first.latitude,latLang.first.longitude),
      zoom: 17.0,
    );
  }

  void setNewPosition(List<LatLng> points){
    if(points.isNotEmpty)
    kGooglePlex =  CameraPosition(
      target: LatLng(points.first.latitude,points.first.longitude),
      zoom: 17,
    );
  }

  setGoogleMapController(GoogleMapController controller) {
    _mapController = controller;
  }

  GoogleMapController? get mapController => _mapController;

  void removeLastPoint() async {
    if (currentPoints.length > 1) {
      final index = pointList.indexOf(LatLng(
          currentPoints.last.latitude ?? 0.0,
          currentPoints.last.longitude ?? 0.0));
      final lastPoint = pointList.last;
      pointList.removeRange(index, pointList.length);
      currentPoints.removeLast();
      markers.remove(markers.last);
      polyline.clear();
      pointList.add(lastPoint);
      polyline.add(Polyline(polylineId:
      PolylineId("foot_polyline"),
          points: pointList,
          width: 3,
          color: AppColors.blue,
          consumeTapEvents: true,
          geodesic: true,
          visible: true));
      update();
    }
  }
  MapType get mapType => _mapType;
}
