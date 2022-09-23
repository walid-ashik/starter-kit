import 'package:app_name/app/ui/view/navigation/cubit/navigation_cubit.dart';
import 'package:app_name/counter/ui/view/sample_page_2.dart';
import 'package:flutter/material.dart';

class SamplePageOne extends StatelessWidget {
  const SamplePageOne({Key? key}) : super(key: key);

  static const String path = '/sample_1';

  @override
  Widget build(BuildContext context) {
    final navigationCubit = context.navigationCubit;
    return Scaffold(
      appBar: AppBar(title: const Text('Sample Page One')),
      body: const Center(child: Text('Page description')),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'sample_page_one',
            onPressed: () {
              debugPrint('Move to next page from page one');
              navigationCubit.push(SamplePageTwo.path);
            },
            child: const Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}
