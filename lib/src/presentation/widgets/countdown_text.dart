import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/bloc/countdown_bloc.dart';

class CountdownText extends StatelessWidget {
  const CountdownText({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final duration =
        context.select((CountdownBloc bloc) => bloc.state.duration);
    final minutesStr =
        ((duration / 60) % 60).floor().toString().padLeft(2, '0');
    final secondsStr = (duration % 60).floor().toString().padLeft(2, '0');
    return Text(
      '$minutesStr:$secondsStr',
      style: Theme.of(context).textTheme.headline1,
    );
  }
}
