import 'dart:io';
import 'dart:math' as math;
import 'dart:ui';

import 'package:ryalize_assignment/utils/localization/app_localization.dart';


///
/// Handle the app dimensions
///

class ScreenUtil {
  static const double kStatusBarHeightIos = 44;
  static const double kStatusBarHeightAndroid = 24;
  static ScreenUtil? _instance;
  static const int defaultWidth = 375;
  static const int defaultHeight = 812;

  late num uiWidthPx;
  late num uiHeightPx;

  late bool allowFontScaling = true;

  static late double _screenWidth;
  static late double _screenHeight;
  static late double _pixelRatio;
  static late double _statusBarHeight;
  static late double _bottomBarHeight;
  static late double _textScaleFactor;

  ScreenUtil._();

  factory ScreenUtil() {
    return _instance = _instance ?? ScreenUtil._();
  }

  static void init(
      {num width = defaultWidth,
      num height = defaultHeight,
      bool allowFontScaling = true}) {
    _instance ??= ScreenUtil._();
    _instance?.uiWidthPx = width;
    _instance?.uiHeightPx = height;
    _instance?.allowFontScaling = allowFontScaling;
    _pixelRatio = window.devicePixelRatio;
    _screenWidth = window.physicalSize.width;
    _screenHeight = window.physicalSize.height;
    _statusBarHeight = window.padding.top;
    _bottomBarHeight = window.padding.bottom;
    _textScaleFactor = window.textScaleFactor;
  }

  /// The number of fonts pixels for each logical pixel.
  static double get textScaleFactor => _textScaleFactor;

  /// The size of the media in logical pixels (e.g, the size of the screen).
  static double get pixelRatio => _pixelRatio;

  /// The horizontal extent of this size.
  static double get screenWidth => _screenWidth / _pixelRatio;

  ///The vertical extent of this size. dp
  static double get screenHeight => _screenHeight / _pixelRatio;

  /// The vertical extent of this size. px
  static double get screenWidthPx => _screenWidth;

  /// The vertical extent of this size. px
  static double get screenHeightPx => _screenHeight;

  /// The offset from the top
  static double get statusBarHeight => _statusBarHeight / _pixelRatio;

  /// The offset from the top
  static double get statusBarHeightPx => _statusBarHeight;

  /// The offset from the bottom.
  static double get bottomBarHeight => _bottomBarHeight;

  /// The ratio of the actual dp to the design draft px
  double get scaleWidth => screenWidth / uiWidthPx;

  double get scaleHeight => screenHeight / uiHeightPx;

  double get scaleText {
    final scale = math.min(scaleHeight,scaleWidth);
    if(scale>1){
      return 1;
    }
    return scale;
  }

  /// Adapted to the device width of the ui Design.
  /// Height can also be adapted according to this to ensure no deformation ,
  /// if you want a square
  num setWidth(num width) => width * scaleWidth;

  /// Highly adaptable to the device according to ui Design
  /// It is recommended to use this method to achieve a high degree of adaptation
  /// when it is found that one screen in the ui design
  /// does not match the current style effect, or if there is a difference in shape.
  num setHeight(num height) => height * scaleHeight;

  ///@param [fontSize]
  ///Font size adaptation method
  ///@param [fontSize] The size of the fonts on the ui design, in px.
  ///@param [allowFontScaling]
  num setSp(num fontSize, {bool? allowFontScalingSelf}) =>
      (allowFontScaling
          ? (fontSize * scaleText)
          : ((fontSize * scaleText) / _textScaleFactor));

  /// returns text direction to update the UI according to the language selected.
  static TextDirection get textDirection => AppLocalizationDelegate.locale == const Locale('ar') ? TextDirection.rtl : TextDirection.ltr;

}

extension ScreenUtilsExtension on num {
  double get toHeight => ScreenUtil().setHeight(this).toDouble();
  double get toWidth => ScreenUtil().setWidth(this).toDouble();
  double get toFont => ScreenUtil().setSp(this).toDouble();
}

extension StatusBarHeight on double{
  double get statusBarHeight{
    if(Platform.isIOS){
      return ScreenUtil.kStatusBarHeightIos;
    }
    return ScreenUtil.kStatusBarHeightAndroid;
  }

  double get removeStatusBarHeight{
    double height = this-statusBarHeight;
    return height<0?10.toHeight:height;
}
}