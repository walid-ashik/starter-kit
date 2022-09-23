import 'package:app_name/app/ui/view/navigation/cubit/navigation_cubit.dart';
import 'package:app_name/app/ui/view/navigation/utility/app_route_information_parser.dart';
import 'package:app_name/app/ui/view/navigation/utility/app_router_delegate.dart';
import 'package:app_name/app/ui/view/navigation/utility/navigation_stack.dart';
import 'package:app_name/app/ui/view/navigation/utility/page_config.dart';
import 'package:app_name/app/ui/view/navigation/utility/route_mapping.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

Future<void> setUpServiceLocators() async {
  await sl.reset();
  sl
    ..registerFactoryParam<PageConfig, String, Map<String, dynamic>?>(
      (location, args) => PageConfig(location: location, args: args),
    )
    ..registerFactoryParam<NavigationStack, List<PageConfig>, void>(
      (list, _) => NavigationStack(list),
    )
    ..registerFactoryParam<NavigationCubit, List<PageConfig>, void>(
      (pageConfigs, _) => NavigationCubit(pageConfigs),
    )
    ..registerFactoryParam<AppRouterDelegate, NavigationCubit, void>(
      (cubit, _) => AppRouterDelegate(cubit),
    )
    ..registerSingleton<AppRouteInformationParser>(
      AppRouteInformationParser(),
    )
    ..registerSingleton<RouteMapping>(
      RouteMapping(),
    )
  ;
}
