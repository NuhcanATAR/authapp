import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum AppLogoConstants {
  logoPrimary('logo_primary');

  final String value;

  const AppLogoConstants(this.value);

  String get toPng => "assets/logo/$value.png";
  Image get toImg => Image.asset(toPng);

  String get toSvg => "assets/logo/$value.svg";
  SvgPicture toSvgImg(
    Color? color,
    double? width,
    double? height,
  ) =>
      SvgPicture.asset(
        toSvg,
        color: color,
        width: width,
        height: height,
      );
}
