import 'package:countdown_timer/src/logic/bloc/countdown_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionsButtons extends StatelessWidget {
  const ActionsButtons({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountdownBloc, CountdownState>(
      buildWhen: (prev, state) => prev.runtimeType != state.runtimeType,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (state is CountdownInitial) ...[
              FloatingActionButton(
                child: const Icon(Icons.play_arrow),
                onPressed: () => context
                    .read<CountdownBloc>()
                    .add(CountdownStarted(duration: state.duration)),
              ),
            ],
            if (state is CountdownRunInProgress) ...[
              FloatingActionButton(
                child: const Icon(Icons.pause),
                onPressed: () => context.read<CountdownBloc>().add(
                      const CountdownPaused(),
                    ),
              ),
              FloatingActionButton(
                child: const Icon(Icons.replay),
                onPressed: () =>
                    context.read<CountdownBloc>().add(const CountdownReset()),
              ),
            ],
            if (state is CountdownRunPause) ...[
              FloatingActionButton(
                child: const Icon(Icons.play_arrow),
                onPressed: () => context.read<CountdownBloc>().add(
                      const CountdownResumed(),
                    ),
              ),
              FloatingActionButton(
                child: const Icon(Icons.replay),
                onPressed: () => context.read<CountdownBloc>().add(
                      const CountdownReset(),
                    ),
              ),
            ],
            if (state is CountdownRunComplete) ...[
              FloatingActionButton(
                child: const Icon(Icons.replay),
                onPressed: () => context.read<CountdownBloc>().add(
                      const CountdownReset(),
                    ),
              ),
            ]
          ],
        );
      },
    );
  }
}
