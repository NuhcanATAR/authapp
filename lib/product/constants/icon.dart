import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum AppIcons {
  accountCircle('account_circle'),
  arrowLeft('arrow_left'),
  duotoneEmail('duotone_email'),
  monotoneLock('monotone_lock'),
  solidWarning('solid_warning'),
  userRounded('user_rounded'),
  eyeOutline('eye_outline'),
  eyeCloseOutline('eyeclose_outline'),
  userOutline('user'),
  signOut('sign_out'),
  add('add');

  final String value;
  const AppIcons(this.value);

  String get toSvg => "assets/icons/$value.svg";
  SvgPicture toSvgImg(
    Color? color,
    double width,
    double height,
  ) =>
      SvgPicture.asset(
        toSvg,
        color: color,
        width: width,
        height: height,
      );

  String get toPng => "assets/icons/$value.png";
  Image toPngImg(
    double width,
    double height,
  ) =>
      Image.asset(
        toPng,
        width: width,
        height: height,
      );
}
