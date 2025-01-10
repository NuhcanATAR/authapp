import 'package:authapp/feature/profile_edit/bloc/cubit.dart';
import 'package:authapp/feature/profile_edit/bloc/event.dart';
import 'package:authapp/feature/profile_edit/bloc/mixin.dart';
import 'package:authapp/feature/profile_edit/profile_edit_view.dart';
import 'package:authapp/product/core/base/base_state/base_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ProfileEditViewModel extends BaseState<ProfileEditView>
    with ProfilEditMixin {
  final formProfileEditKey = GlobalKey<FormState>();

  late TextEditingController nameController = TextEditingController(
    text: widget.userModel.profile?.name,
  );
  late TextEditingController surnameController = TextEditingController(
    text: widget.userModel.profile?.surname,
  );
  late TextEditingController bioController = TextEditingController(
    text: widget.userModel.profile?.bio,
  );

  Future<void> profileUpdate() async {
    if (formProfileEditKey.currentState!.validate()) {
      context.read<ProfileBloc>().add(
            ProfileEvent(
              nameController.text,
              surnameController.text,
              bioController.text,
            ),
          );
    }
  }
}
