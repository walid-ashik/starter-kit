import 'package:app_name/app/ui/view/navigation/cubit/navigation_cubit.dart';
import 'package:app_name/counter/ui/counter_ui.dart';
import 'package:app_name/counter/ui/cubit/counter_cubit.dart';
import 'package:app_name/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const CounterView(),
    );
  }
}

class CounterView extends StatelessWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final navigationCubit = context.navigationCubit;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.counterAppBarTitle)),
      body: const Center(child: CounterText()),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'first',
            onPressed: () {
              // context.read<CounterCubit>().increment();
              navigationCubit.push('/sample_1');
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            heroTag: 'second',
            onPressed: navigationCubit.pop,
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

class CounterText extends StatelessWidget {
  const CounterText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // final count = BlocProvider.of<CounterCubit>(context).state;
    return Text('Go', style: theme.textTheme.headline1);
  }
}
