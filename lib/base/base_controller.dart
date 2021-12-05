import 'package:e_space_mobile/data/data_source/local_source.dart';
import 'package:get/get.dart';

abstract class BaseController extends GetxController {
  LocalSource _localSource = LocalSource.getInstance();

  LocalSource get localSource => _localSource;

  bool _isLoading = false;

  void setLoading(bool value) {
    _isLoading = value;
    update();
  }

  bool get isLoading => _isLoading;

  showErrorMessage(String error){
    Get.snackbar("error".tr, error);
  }
  showSuccessMessage(String message){
    Get.snackbar("message".tr, message);
  }
}
