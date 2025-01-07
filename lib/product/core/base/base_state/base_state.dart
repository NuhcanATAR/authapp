import 'package:authapp/product/core/base/helper/logger_package.dart';
import 'package:authapp/product/core/base/helper/shared_service.dart';
import 'package:authapp/product/extension/dynamic_extension.dart';
import 'package:flutter/material.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  // dynamic extensions
  DynamicViewExtensions dynamicViewExtensions = DynamicViewExtensions();

  // logger
  final loggerPrint = CustomLoggerPrint();

  // shaed preference service
  final prefService = PrefService();
}
