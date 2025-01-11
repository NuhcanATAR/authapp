import 'package:authapp/product/extension/dynamic_extension.dart';
import 'package:authapp/product/util/util.dart';
import 'package:authapp/product/widget/text_widget/body_medium.dart';
import 'package:authapp/product/widget/text_widget/title_large.dart';
import 'package:flutter/material.dart';

class TitleSubTitleWidget extends StatelessWidget {
  const TitleSubTitleWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.dynamicViewExtensions,
  });

  final String title;
  final String subTitle;
  final DynamicViewExtensions dynamicViewExtensions;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // title
        SizedBox(
          width: dynamicViewExtensions.maxWidth(context),
          child: Padding(
            padding: BaseUtility.vertical(
              BaseUtility.paddingNormalValue,
            ),
            child: TitleLargeBlackBoldText(
              text: title,
              textAlign: TextAlign.left,
            ),
          ),
        ),
        // sub title
        SizedBox(
          width: dynamicViewExtensions.maxWidth(context),
          child: Padding(
            padding: BaseUtility.vertical(
              BaseUtility.paddingSmallValue,
            ),
            child: BodyMediumBlackText(
              text: subTitle,
              textAlign: TextAlign.left,
            ),
          ),
        ),
      ],
    );
  }
}
