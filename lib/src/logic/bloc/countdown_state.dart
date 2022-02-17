part of 'countdown_bloc.dart';

abstract class CountdownState extends Equatable {
  const CountdownState(
    this.duration,
  );
  final int duration;

  @override
  List<Object> get props => [duration];
}

class CountdownInitial extends CountdownState {
  const CountdownInitial(int duration) : super(duration);
  @override
  String toString() => 'CountdownInitial { duration: $duration}';
}

class CountdownRunPause extends CountdownState {
  const CountdownRunPause(int duration) : super(duration);
  @override
  String toString() => 'CountdownRunPause { duration: $duration}';
}

class CountdownRunInProgress extends CountdownState {
  const CountdownRunInProgress(int duration) : super(duration);
  @override
  String toString() => 'CountdownRunPause { duration: $duration}';
}

class CountdownRunComplete extends CountdownState {
  const CountdownRunComplete() : super(0);
}
