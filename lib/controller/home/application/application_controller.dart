import 'package:e_space_mobile/base/base_controller.dart';

class ApplicationController extends BaseController {
  int _index = 0;

  int get index => _index;

  setIndex(int value) {
    _index = value;
    update();
  }
}
