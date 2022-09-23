import 'package:app_name/core/widgets/app_component.dart';
import 'package:app_name/counter/ui/view/counter_page.dart';
import 'package:app_name/counter/ui/view/sample_page_1.dart';
import 'package:app_name/counter/ui/view/sample_page_2.dart';
import 'package:app_name/home/ui/widget/home_page.dart';
import 'package:flutter/material.dart';

class RouteMapping {
  final defaultPage = const MaterialPage<AppComponent>(child: AppComponent());

  Page getPage(String route, Map<String, dynamic>? args) {
    final Page p = _routes[route]?.call(args) ?? defaultPage;
    return p;
  }

  final Map<String, MaterialPage Function(Map<String, dynamic>?)> _routes =
      <String, MaterialPage Function(Map<String, dynamic>?)>{
    '/': (_) => const MaterialPage<AppComponent>(child: AppComponent()),
    HomePage.path: (args) => const MaterialPage<HomePage>(
          child: HomePage(),
        ),
    SamplePageOne.path: (args) =>
        const MaterialPage<SamplePageOne>(child: SamplePageOne()),
    SamplePageTwo.path: (args) =>
        const MaterialPage<SamplePageTwo>(child: SamplePageTwo()),
  };
}
