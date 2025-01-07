import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum AppImages {
  facebook('facebook'),
  figma('figma'),
  frameFive('frame_five'),
  frameFour('frame_four'),
  frameOne('frame_one'),
  frameSecond('frame_second'),
  frameSix('frame_six'),
  frame('frame'),
  imgOne('img_one'),
  imgSecond('img_second'),
  instagram('instagram'),
  suprise('suprise'),
  imgFrame('img_frame'),
  imgFrameSecond('img_frame_second');

  final String value;
  const AppImages(this.value);

  String get toSvg => "assets/images/$value.svg";
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

  String get toPng => "assets/images/$value.png";
  Image toPngImg(
    double width,
    double height,
  ) =>
      Image.asset(
        toPng,
        width: width,
        height: height,
      );

  String get toJpg => "assets/images/$value.jpg";
  Image toJpgImg(
    double width,
    double height,
  ) =>
      Image.asset(
        toPng,
        width: width,
        height: height,
      );
}
