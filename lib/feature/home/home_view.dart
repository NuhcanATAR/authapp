import 'package:authapp/feature/home/bloc/cubit.dart';
import 'package:authapp/feature/home/bloc/state.dart';
import 'package:authapp/feature/home/home_viewmodel.dart';
import 'package:authapp/feature/profile_edit/profile_edit_view.dart';
import 'package:authapp/feature/users/users_view.dart';
import 'package:authapp/product/constants/icon.dart';
import 'package:authapp/product/core/base/helper/navigator_router.dart';
import 'package:authapp/product/model/user_model/user_model.dart';
import 'package:authapp/product/util/util.dart';
import 'package:authapp/product/widget/text_widget/body_medium.dart';
import 'package:authapp/product/widget/text_widget/label_medium.dart';
import 'package:authapp/product/widget/text_widget/title_large.dart';
import 'package:authapp/product/widget/text_widget/title_medium.dart';
import 'package:authapp/product/widget/widget/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends HomeViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: true,
        title: const BodyMediumBlackText(
          text: 'Home',
          textAlign: TextAlign.center,
        ),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeLoaded) {
            final UserModel user = state.userModel;
            return Padding(
              padding: BaseUtility.all(
                BaseUtility.paddingNormalValue,
              ),
              child: ListView(
                children: <Widget>[
                  // title and sub title
                  buildTitleSubTitleWidget,
                  // profile avatar
                  buildProfileAvatar,
                  // user information
                  buildUserInfoWidget(user),
                  // menus
                  buildMenusWidget(user),
                ],
              ),
            );
          } else if (state is HomeError) {
            return Text(state.errorMessage);
          } else {
            return const Text('No data found');
          }
        },
      ),
    );
  }

  // title and sub title
  Widget get buildTitleSubTitleWidget => Padding(
        padding: BaseUtility.bottom(
          BaseUtility.paddingMediumValue,
        ),
        child: Column(
          children: <Widget>[
            // title
            SizedBox(
              width: dynamicViewExtensions.maxWidth(context),
              child: Padding(
                padding: BaseUtility.bottom(
                  BaseUtility.paddingMediumValue,
                ),
                child: const TitleLargeBlackBoldText(
                  text: 'Auth App Welcome',
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            // sub title
            SizedBox(
              width: dynamicViewExtensions.maxWidth(context),
              child: Padding(
                padding: BaseUtility.bottom(
                  BaseUtility.paddingMediumValue,
                ),
                child: const BodyMediumBlackText(
                  text: 'Hello, you can start using your Auth App Account.',
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ],
        ),
      );

  // profile avatar
  Widget get buildProfileAvatar => Padding(
        padding: BaseUtility.vertical(
          BaseUtility.paddingNormalValue,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: BaseUtility.all(
                BaseUtility.paddingNormalValue,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    BaseUtility.radiusCircularHighValue,
                  ),
                ),
              ),
              child: AppIcons.userOutline.toSvgImg(
                Colors.white,
                BaseUtility.iconLargeSize,
                BaseUtility.iconLargeSize,
              ),
            ),
          ],
        ),
      );

  // user information
  Widget buildUserInfoWidget(UserModel user) => Column(
        children: <Widget>[
          // title
          Padding(
            padding: BaseUtility.bottom(
              BaseUtility.paddingMediumValue,
            ),
            child: TitleMediumBlackBoldText(
              text:
                  "${user.profile?.name ?? 'Name'} ${user.profile?.surname ?? 'Surname'}",
              textAlign: TextAlign.left,
            ),
          ),
          // bio
          Padding(
            padding: BaseUtility.bottom(
              BaseUtility.paddingMediumValue,
            ),
            child: LabelMediumBlackText(
              text: user.profile?.bio ?? 'Bio',
              textAlign: TextAlign.left,
            ),
          ),
          // sub title
          Padding(
            padding: BaseUtility.bottom(
              BaseUtility.paddingMediumValue,
            ),
            child: BodyMediumBlackBoldText(
              text: user.email,
              textAlign: TextAlign.left,
            ),
          ),
        ],
      );

  // menus
  Widget buildMenusWidget(UserModel user) => Padding(
        padding: BaseUtility.top(
          BaseUtility.paddingHightValue,
        ),
        child: Column(
          children: <Widget>[
            // user edit
            MenuWidget(
              onTap: () => CodeNoahNavigatorRouter.push(
                context,
                ProfileEditView(
                  userModel: user,
                ),
              ),
              menuText: 'Edit Information',
              menuIcon: AppIcons.userOutline,
            ),
            // users list
            MenuWidget(
              onTap: () => CodeNoahNavigatorRouter.push(
                context,
                const UsersView(),
              ),
              menuText: 'Kullanıcılar',
              menuIcon: AppIcons.arrowRight,
            ),
            // exit account
            MenuWidget(
              onTap: signOut,
              menuText: 'Sign Out',
              menuIcon: AppIcons.signOut,
            ),
          ],
        ),
      );
}
