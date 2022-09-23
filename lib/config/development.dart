import 'package:app_name/config/env.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class Development extends Env {
  Development() {
    appName = '';
    baseUrl = '';
    primarySwatch = Colors.amber;
    environmentType = EnvType.development;
    logLevel = Level.ALL;
  }
}
