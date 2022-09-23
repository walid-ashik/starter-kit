import 'package:app_name/app/ui/view/navigation/cubit/navigation_cubit.dart';
import 'package:app_name/app/ui/view/navigation/utility/app_route_information_parser.dart';
import 'package:app_name/app/ui/view/navigation/utility/app_router_delegate.dart';
import 'package:app_name/app/ui/view/navigation/utility/page_config.dart';
import 'package:app_name/config/service_locator.dart';
import 'package:app_name/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  late NavigationCubit navigationCubit;
  late AppRouterDelegate appRouterDelegate;

  @override
  void initState() {
    super.initState();
    navigationCubit = sl<NavigationCubit>(
      param1: [
        sl<PageConfig>(
          param1: '/',
          param2: <String, int>{'key': 42},
        ),
      ],
    );

    appRouterDelegate = sl<AppRouterDelegate>(
      param1: navigationCubit,
    );
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return BlocProvider.value(
      value: navigationCubit,
      child: MaterialApp.router(
        locale: const Locale('en'),
        theme: ThemeData(
          appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
          colorScheme: ColorScheme.fromSwatch(
            accentColor: const Color(0xFF13B9FF),
          ),
        ),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        routerDelegate: appRouterDelegate,
        routeInformationParser: sl<AppRouteInformationParser>(),
      ),
    );
  }

  BuildContext get navigationContext =>
      appRouterDelegate.navigatorKey.currentState!.context;

  bool _isNavigationContextAvailable() =>
      appRouterDelegate.navigatorKey.currentState?.context != null;

  NavigatorState? get _navigatorState =>
      appRouterDelegate.navigatorKey.currentState;
}
