import 'dart:async';

import 'package:app_name/app/ui/view/navigation/cubit/navigation_cubit.dart';
import 'package:app_name/home/ui/widget/home_page.dart';
import 'package:flutter/material.dart';

class AppComponent extends StatefulWidget {
  const AppComponent({Key? key}) : super(key: key);

  @override
  State createState() {
    return AppComponentState();
  }
}

class AppComponentState extends State<AppComponent>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    _delayThenMoveToNextPage();
  }

  @override
  Future<void> dispose() async {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Splash Screen',
        ),
      ),
    );
  }

  void _delayThenMoveToNextPage() {
    Future.delayed(const Duration(seconds: 2), () {
      context.navigationCubit.clearAndPush(HomePage.path);
    });
  }
}
