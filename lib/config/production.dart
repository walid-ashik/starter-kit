import 'package:app_name/config/env.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class Production extends Env {
  Production() {
    appName = '';
    baseUrl = '';
    primarySwatch = Colors.amber;
    environmentType = EnvType.development;
    logLevel = Level.OFF;
  }
}
