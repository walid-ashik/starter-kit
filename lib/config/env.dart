import 'package:app_name/config/service_locator.dart';
import 'package:app_name/core/widgets/app_component.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

enum EnvType {
  development,
  staging,
  production,
}


class Env {

  Env() {
    value = this;
  }

  static late Env value;

  late String appName;
  late String baseUrl;
  late Color primarySwatch;
  EnvType environmentType = EnvType.development;
  Level logLevel = Level.OFF;


  Future<void> init() async{
    await setUpServiceLocators();
    await sl.allReady();
    // sl<NavigationCubit>().push('/', <String, int>{'hi': 2});
    // await Future.delayed(Duration(seconds: 1), () => "hello");
  }

  void startAppComponent() {
    runApp(const AppComponent());
  }
}
