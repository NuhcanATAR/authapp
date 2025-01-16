import 'package:authapp/product/util/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpCodeFieldWidget extends StatelessWidget {
  const OtpCodeFieldWidget({
    super.key,
    required this.onCodeChanged,
    required this.onSubmit,
  });

  final Function(String)? onCodeChanged;
  final Function(String)? onSubmit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: BaseUtility.vertical(
        BaseUtility.paddingHightValue,
      ),
      child: OtpTextField(
        fieldHeight: 55,
        fieldWidth: 55,
        numberOfFields: 5,
        borderColor: Theme.of(context).colorScheme.primary,
        showFieldAsBox: true,
        onCodeChanged: onCodeChanged,
        onSubmit: onSubmit,
      ),
    );
  }
}
