import 'package:app_name/app/ui/view/navigation/cubit/navigation_cubit.dart';
import 'package:app_name/app/ui/view/navigation/utility/navigation_stack.dart';
import 'package:app_name/app/ui/view/navigation/utility/page_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///PopNavigatorRouterDelegateMixin wires android physical
///back button to its child Navigator
class AppRouterDelegate extends RouterDelegate<PageConfig>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<PageConfig> {
  AppRouterDelegate(this._cubit);

  final NavigationCubit _cubit;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavigationCubit, NavigationStack>(
      bloc: _cubit,
      builder: (context, stack) => Navigator(
        pages: stack.pages,
        key: navigatorKey,
        onPopPage: _onPopPage.call,
      ),
      listener: (context, stack) {
        debugPrint('route: ${stack.last.route}');
      },
    );
  }

  ///here we handle back buttons
  bool _onPopPage(Route<dynamic> route, dynamic result) {
    final didPop = route.didPop(result);
    if (!didPop) {
      return false;
    }
    if (_cubit.canPop()) {
      _cubit.pop();
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<void> setNewRoutePath(PageConfig configuration) async {
    if (configuration.route != '/')
      _cubit.push(configuration.route, configuration.args);
  }

  ///called by router when it detects it may have changed because of a rebuild
  ///necessary for backward and forward buttons to work properly
  @override
  PageConfig? get currentConfiguration => _cubit.state.last;

  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
}
