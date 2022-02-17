import 'package:countdown_timer/src/logic/bloc/countdown_bloc.dart';
import 'package:countdown_timer/src/logic/ticker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'countdown_view.dart';

class CountdownPage extends StatelessWidget {
  const CountdownPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CountdownBloc>(
      create: (_) => CountdownBloc(
        ticker: const Ticker(),
      ),
      child: const CountdownView(),
    );
  }
}
