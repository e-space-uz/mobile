import 'package:e_space_mobile/base/base_controller.dart';
import 'package:e_space_mobile/data/models/area/statuses/statuses_response.dart';
import 'package:e_space_mobile/data/models/home/entity/entity_model_response.dart';
import 'package:e_space_mobile/data/models/home/suggestion/address/city_model_response.dart';
import 'package:e_space_mobile/data/models/home/suggestion/address/district_model_response.dart';
import 'package:e_space_mobile/data/repository/area_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MainAreaController extends BaseController{

  AreaRepository? _areaRepository;

  MainAreaController(){
    _areaRepository = AreaRepository();
  }

  int _page = 1;
  int _limit = 10;

  DateTime? _dateTime;
  DateTime? _selectedDate;
  DateTime? get  dateTime=> _dateTime;

  List<Entities> _entities = [];
  List<Entities> get entities => _entities;

  bool _isVisible = false;
  bool _isVisibleRegion = false;
  bool _isVisibleStatus = false;
  bool _isVisibleDatePicker = false;

  bool get isVisibleRegion => _isVisibleRegion;
  bool get isVisible => _isVisible;
  bool get isVisibleStatus => _isVisibleStatus;
  bool get isVisibleDatePicker => _isVisibleDatePicker;

  // viloyat
  List<Cities> _cities = [];
  List<Cities> get cities => _cities;
  List<String> citiesName = [];
  Cities? _selectedCity;
  Cities? get selectedCity=> _selectedCity;

  //tuman
  List<Regions> _regions = [];
  List<Regions> get regions => _regions;
  List<String> regionsName = [];
  Regions? _selectedRegion;
  Regions? get selectedRegion => _selectedRegion;

  List<Statuses> _statuses = [];
  List<Statuses> get statuses => _statuses;
  List<String> statusesName = [];
  Statuses? _selectedStatus;
  Statuses? get selectedStatus=> _selectedStatus;

  ScrollController scrollController = ScrollController();
  RxBool isPagingProcess = false.obs;

  onReady() async {
  super.onReady();
  await getEntitiesByFilter();
  await getAllStatuses();
  // await getCities();

  scrollController.addListener(() {
    if (scrollController.position.maxScrollExtent ==
        scrollController.position.pixels) {
      getEntitiesByFilter();
    }
  });
  }

  void setNewDate(DateTime newDate){
    _dateTime = newDate;
    update();
  }

  void dateSelected(){
    _isVisibleDatePicker = false;
    _selectedDate  = _dateTime;
    _page = 1;
    getEntitiesByFilter();
  }

  void updateVisibility() async {
    if(!_isVisible && _cities.isEmpty){
      await getCities();
    }
    _isVisible = !_isVisible;
    update();
  }

  void updateVisibilityRegion(){
    if(_selectedCity!=null){
      _isVisibleRegion = !_isVisibleRegion;
      update();
    }
  }

  void updateVisibilityStatus(){
    _isVisibleStatus = !_isVisibleStatus;
    update();
  }

  void updateVisibilityDatePicker(){
    _isVisibleDatePicker = !_isVisibleDatePicker;
    update();
  }

  Future<void> getEntity() async {
    setLoading(true);
    var response = await _areaRepository?.getEntity(
        _page,
        _limit);
    setLoading(false);
    if(response is EntityModelResponse){
      _entities = response.entities??[];
      update();
    }else{
      showErrorMessage(response.toString());
    }
  }

  int _filterPage = 1;

  Future<List<Entities>> getEntitiesByFilter() async {
    String cityId = _selectedCity?.id??'';
    String regionId = _selectedRegion?.id??'';
    String statusId = _selectedStatus?.id??'';
    String date = '';

    if(_selectedDate !=null){
      date = '${_selectedDate?.year}-${_selectedDate?.month}-'
          '${((_selectedDate?.day??0)>9)?_selectedDate?.day:'0${_selectedDate?.day}'}';
    }

    if(_page == 1) setLoading(true);
    else isPagingProcess.value = true;
    var response = await _areaRepository?.getEntityByFilter(
      _page,
      _limit,
      cityId,
      regionId,
      statusId,
      date
    );
    setLoading(false);
    isPagingProcess.value = false;
    if(response is EntityModelResponse){
      if(_page == 1){
        _entities = response.entities??[];
      }else{
        _entities.addAll(response.entities??[]);
      }
      // _filterPage++;
      _page++;
      update();
    }else{
      showErrorMessage(response.toString());
    }
    return _entities;
  }

  // viloyat
  setRegion(int index) async {
    _selectedCity = _cities[index];
    // _isVisible = !_isVisible;
    // update();
    _page = 1;
    await getEntitiesByFilter();
    await getDistricts(_selectedCity?.id??'');
  }

  clearRegion() async {
    _selectedCity = null;
    _selectedRegion = null;
    // update();
    _page = 1;
    await getEntitiesByFilter();
  }

  // tuman
  setDistrict(int index) async {
    _selectedRegion = _regions[index];
    _page = 1;
    await getEntitiesByFilter();
  }

  clearDistrict() async {
    _selectedRegion = null;
    _page = 1;
    getEntitiesByFilter();
  }

  clearDate() async {
    _selectedDate = null;
    _page = 1;
    getEntitiesByFilter();
  }

  // status
  setStatuses(int index) async {
    _selectedStatus = _statuses[index];
    // update();
    _page = 1;
    getEntitiesByFilter();
  }

  clearStatus() async {
    _selectedStatus = null;
    update();
    _page = 1;
    getEntitiesByFilter();
  }

  Future<void> getCities() async {
    setLoading(true);
    var response = await _areaRepository?.getCities();
    setLoading(false);
    if(response is CityModelResponse){
      _cities = response.cities??[];
      // _selectedCity = response.cities?[0];
      citiesName.clear();
      _cities.forEach((element) {
        citiesName.add(element.name??'');
      });
      update();
    }else{
      showErrorMessage(response.toString());
    }
  }

  Future<void> getAllStatuses() async {
    setLoading(true);
    var response = await _areaRepository?.getAllStatuses(1,150);
    setLoading(false);
    if(response is StatusesResponse){
      _statuses = response.statuses??[];
      statusesName.clear();
      _statuses.forEach((element) {
        statusesName.add(element.name??'');
      });
      update();
    }else{
      showErrorMessage(response.toString());
    }
  }

  Future<void> getDistricts(String cityId) async {
    setLoading(true);
    var response = await _areaRepository?.getDistricts(cityId);
    setLoading(false);
    if(response is DistrictModelResponse){
      _regions = response.regions??[];
      regionsName.clear();
      _regions.forEach((element) {
        regionsName.add(element.name??'');
      });
      update();
    }else{
      showErrorMessage(response.toString());
    }
  }

  Future<List<Entities>> getEntitiesForRefresh() async {
    _page = 1;
    var response = await _areaRepository?.getEntity(
        _page,
        _limit);
    if(response is EntityModelResponse){
      _entities.clear();
      _entities = response.entities??[];
      // update();
    }else{
      showErrorMessage(response.toString());
    }
    return _entities;
  }

  String get selectedDate => _selectedDate==null?'':
  '${_selectedDate?.day??''}.${_selectedDate?.month??''}.${_selectedDate?.year??''}';

}