import 'package:authapp/product/constants/icon.dart';
import 'package:authapp/product/model/user_model/user_model.dart';
import 'package:authapp/product/util/util.dart';
import 'package:authapp/product/widget/text_widget/body_medium.dart';
import 'package:authapp/product/widget/text_widget/title_medium.dart';
import 'package:flutter/material.dart';

class UserCardWidget extends StatelessWidget {
  const UserCardWidget({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: AppIcons.userOutline.toSvgImg(
        Theme.of(context).colorScheme.primary,
        BaseUtility.iconNormalSize,
        BaseUtility.iconNormalSize,
      ),
      title: TitleMediumBlackBoldText(
        text: user.email,
        textAlign: TextAlign.left,
      ),
      subtitle: user.profile != null
          ? BodyMediumBlackText(
              text:
                  '${user.profile?.name ?? ''} ${user.profile?.surname ?? ''}',
              textAlign: TextAlign.left,
            )
          : null,
    );
  }
}
