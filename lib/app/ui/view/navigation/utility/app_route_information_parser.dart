import 'package:app_name/app/ui/view/navigation/utility/page_config.dart';
import 'package:flutter/widgets.dart';

class AppRouteInformationParser extends RouteInformationParser<PageConfig> {
  ///get a location (path) from the system and build your route wrapping object
  @override
  Future<PageConfig> parseRouteInformation(
      RouteInformation routeInformation,
      ) async {
    final path = routeInformation.location ?? '';
    final config = PageConfig(
      location: path,
      args: const <String, String>{'key2': 'value2'},
    );
    return config;
  }

  ///update the URL bar with the latest URL from the app
  @override
  RouteInformation? restoreRouteInformation(PageConfig configuration) {
    return RouteInformation(location: configuration.path.toString());
  }
}
