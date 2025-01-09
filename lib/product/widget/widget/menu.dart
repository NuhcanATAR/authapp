import 'package:authapp/product/constants/icon.dart';
import 'package:authapp/product/util/util.dart';
import 'package:authapp/product/widget/text_widget/body_medium.dart';
import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({
    super.key,
    required this.onTap,
    required this.menuText,
    required this.menuIcon,
  });

  final Function() onTap;
  final String menuText;
  final AppIcons menuIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: BaseUtility.vertical(
          BaseUtility.paddingNormalValue,
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: BodyMediumBlackBoldText(
                text: menuText,
                textAlign: TextAlign.left,
              ),
            ),
            menuIcon.toSvgImg(
              Theme.of(context).colorScheme.primary,
              BaseUtility.iconNormalSize,
              BaseUtility.iconNormalSize,
            ),
          ],
        ),
      ),
    );
  }
}
