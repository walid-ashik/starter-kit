import 'package:app_name/app/ui/view/navigation/utility/navigation_stack.dart';
import 'package:app_name/app/ui/view/navigation/utility/page_config.dart';
import 'package:app_name/config/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension NavigationCubitExtension on BuildContext {
  NavigationCubit get navigationCubit => BlocProvider.of<NavigationCubit>(this);
}

class NavigationCubit extends Cubit<NavigationStack> {
  NavigationCubit(List<PageConfig> initialPages)
      : super(sl<NavigationStack>(param1: initialPages));

  void push(String path, [Map<String, dynamic>? args]) {
    // Log.info('push called with $path and $args');
    final config = PageConfig(location: path, args: args);
    emit(state.push(config));
  }

  void clearAndPush(String path, [Map<String, dynamic>? args]) {
    final config = PageConfig(location: path, args: args);
    emit(state.clearAndPush(config));
  }

  void pop() {
    emit(state.pop());
  }

  bool canPop() {
    return state.canPop();
  }

  void pushBeneathCurrent(String path, [Map<String, dynamic>? args]) {
    final config = PageConfig(location: path, args: args);
    emit(state.pushBeneathCurrent(config));
  }

  void replace(String path, [Map<String, dynamic>? args]) {
    final config = PageConfig(location: path, args: args);
    emit(state.replace(config));
  }
}
