import 'package:app_name/app/ui/view/navigation/cubit/navigation_cubit.dart';
import 'package:app_name/home/ui/widget/home_page.dart';
import 'package:flutter/material.dart';

class SamplePageTwo extends StatelessWidget {
  const SamplePageTwo({Key? key}) : super(key: key);

  static const String path = '/sample_2';

  @override
  Widget build(BuildContext context) {
    final navigationCubit = context.navigationCubit;
    return Scaffold(
      appBar: AppBar(title: const Text('Sample Page Two')),
      body: const Center(child: Text('Page description')),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'sample_page_two',
            onPressed: () {
              debugPrint('Move to home from page two');
              navigationCubit.clearAndPush(HomePage.path);
            },
            child: const Icon(Icons.home),
          ),
        ],
      ),
    );
  }
}
