import 'package:common/common.dart';

class AppResponsive {

  static AppResponsive _instance;
  static const double _WIDTH = 414;
  static const double _HEIGHT = 896;
  double _percentualWidth;
  double _percentualHeight;
  double _statusBarSize;
  double _actionBarSize;

  factory AppResponsive (){

    _instance ??= AppResponsive._internalConstructor();

    return _instance;
  }

  AppResponsive._internalConstructor();

  void setWidth (double width) {
    if (_percentualWidth == null) {
      _percentualWidth = width / _WIDTH;
      if (_percentualWidth > 1) {
        _percentualWidth = 1;
      }
      AppFonts.setResponsive();
    }
  }

  void setHeight (double height) {
    if (_percentualHeight == null) {
      //desconsidera o tamanho da statusBar e da actionBar
      height -= _statusBarSize;
      height -= _actionBarSize;
      _percentualHeight = height / _HEIGHT;
      if (_percentualHeight > 1){
        _percentualHeight = 1;
      }
    }
  }

  double getWidth(double width) => _percentualWidth * width;
  double getHeight(double height) => _percentualHeight * height;
  void setStatusBarSize(double size) => _statusBarSize = size;
  void setActionBarSize(double size) =>  _actionBarSize = size;
  double get statusBarSize => _statusBarSize;
  double get actionBarSize => _actionBarSize;
}