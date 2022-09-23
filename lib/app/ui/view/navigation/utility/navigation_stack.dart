import 'package:app_name/app/ui/view/navigation/utility/page_config.dart';
import 'package:app_name/app/ui/view/navigation/utility/route_mapping.dart';
import 'package:app_name/config/service_locator.dart';
import 'package:flutter/material.dart';

class NavigationStack {
  NavigationStack(this._stack);

  final List<PageConfig> _stack;

  List<Page> get pages {
    return List.unmodifiable(
      _stack.map<Page>(
            (e) => sl<RouteMapping>().getPage(e.route, e.args),
      ),
    );
  }

  List<PageConfig> get configs => _stack;

  int get length => _stack.length;

  PageConfig get first => _stack.first;

  PageConfig get last => _stack.last;

  ///the reason behind returning Navigation Stack instead of just being a void
  ///is to chain calls as we'll see in navigation_cubit.dart
  //not to go into how a cubit defines a state to be new with lists,
  //I've just returned a new instance

  void clear() {
    if(_stack.length > 1) {
      _stack.removeRange(0, _stack.length - 2);
    }
    //pages list in navigator can't be empty, remember
  }

  bool canPop() {
    return _stack.length > 1;
  }

  NavigationStack pop() {
    if (canPop()) _stack.remove(_stack.last);
    return NavigationStack(_stack);
  }

  NavigationStack pushBeneathCurrent(PageConfig config) {
    _stack.insert(_stack.length - 1, config);
    return NavigationStack(_stack);
  }

  NavigationStack push(PageConfig config) {
    if (_stack.last != config) _stack.add(config);
    return NavigationStack(_stack);
  }

  NavigationStack replace(PageConfig config) {
    if (canPop()) {
      _stack.removeLast();
      push(config);
    } else {
      _stack
        ..insert(0, config)
        ..removeLast();
    }
    return NavigationStack(_stack);
  }

  NavigationStack clearAndPush(PageConfig config) {
    _stack
      ..clear()
      ..add(config);
    return NavigationStack(_stack);
  }

  NavigationStack clearAndPushAll(List<PageConfig> configs) {
    _stack
      ..clear()
      ..addAll(configs);
    return NavigationStack(_stack);
  }
}