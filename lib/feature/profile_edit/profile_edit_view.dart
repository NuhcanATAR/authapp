import 'package:authapp/feature/profile_edit/bloc/cubit.dart';
import 'package:authapp/feature/profile_edit/bloc/state.dart';
import 'package:authapp/feature/profile_edit/profile_edit_viewmodel.dart';
import 'package:authapp/product/core/base/helper/button_control.dart';
import 'package:authapp/product/model/user_model/user_model.dart';
import 'package:authapp/product/util/util.dart';
import 'package:authapp/product/widget/text_widget/body_medium.dart';
import 'package:authapp/product/widget/widget/button.dart';
import 'package:authapp/product/widget/widget/normal_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileEditView extends StatefulWidget {
  const ProfileEditView({
    super.key,
    required this.userModel,
  });

  final UserModel userModel;
  @override
  State<ProfileEditView> createState() => _ProfileEditViewState();
}

class _ProfileEditViewState extends ProfileEditViewModel {
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
          text: 'Profile Edit',
          textAlign: TextAlign.center,
        ),
      ),
      body: BlocConsumer<ProfileBloc, ProfileEditState>(
        listener: profilEditListenerBloc,
        builder: (context, state) {
          return buildBodyWidget;
        },
      ),
    );
  }

  // body
  Widget get buildBodyWidget => Form(
        key: formProfileEditKey,
        child: Padding(
          padding: BaseUtility.all(
            BaseUtility.paddingNormalValue,
          ),
          child: ListView(
            children: <Widget>[
              // form
              buildFormWidget,
              // save button
              buildSaveButtonWidget,
            ],
          ),
        ),
      );

  // form
  Widget get buildFormWidget => Column(
        children: <Widget>[
          // name surname
          Row(
            children: <Widget>[
              // name
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: Padding(
                  padding: BaseUtility.right(
                    BaseUtility.paddingMediumValue,
                  ),
                  child: NormalTextFieldWidget(
                    controller: nameController,
                    hintText: 'Name',
                    explanationStatus: false,
                    onChanged: (val) {},
                    isValidator: true,
                    enabled: true,
                    isLabelText: true,
                    dynamicViewExtensions: dynamicViewExtensions,
                  ),
                ),
              ),
              // surname
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: Padding(
                  padding: BaseUtility.left(
                    BaseUtility.paddingMediumValue,
                  ),
                  child: NormalTextFieldWidget(
                    controller: surnameController,
                    hintText: 'Surname',
                    explanationStatus: false,
                    onChanged: (val) {},
                    isValidator: true,
                    enabled: true,
                    isLabelText: true,
                    dynamicViewExtensions: dynamicViewExtensions,
                  ),
                ),
              ),
            ],
          ),
          // bio
          NormalTextFieldWidget(
            controller: bioController,
            hintText: 'Bio',
            explanationStatus: false,
            onChanged: (val) {},
            isValidator: true,
            enabled: true,
            isLabelText: true,
            dynamicViewExtensions: dynamicViewExtensions,
          ),
        ],
      );

  // save button
  Widget get buildSaveButtonWidget => CustomButtonWidget(
        dynamicViewExtensions: dynamicViewExtensions,
        text: 'SAVE',
        func: profileUpdate,
        btnStatus: ButtonTypes.primaryColorButton,
      );
}
