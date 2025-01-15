import 'package:authapp/feature/otp/otp_viewmodel.dart';
import 'package:flutter/material.dart';

class OtpView extends StatefulWidget {
  const OtpView({super.key});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends OtpViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OTP View"),
      ),
    );
  }
}
