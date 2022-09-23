import 'package:app_name/app/ui/view/navigation/cubit/navigation_cubit.dart';
import 'package:app_name/counter/ui/view/sample_page_1.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String path = '/homePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const Center(child: Text('HomePage')),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'sample_page_two',
            onPressed: () {
              debugPrint('Move to home from page two');
              context.navigationCubit.push(SamplePageOne.path);
            },
            child: const Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}
