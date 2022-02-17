part of 'countdown_bloc.dart';

abstract class CountdownEvent extends Equatable {
  const CountdownEvent();

  @override
  List<Object> get props => [];
}

class CountdownStarted extends CountdownEvent {
  const CountdownStarted({required this.duration});
  final int duration;
}

class CountdownPaused extends CountdownEvent {
  const CountdownPaused();
}

class CountdownResumed extends CountdownEvent {
  const CountdownResumed();
}

class CountdownReset extends CountdownEvent {
  const CountdownReset();
}

class CountdownTicked extends CountdownEvent {
  const CountdownTicked({required this.duration});
  final int duration;

  @override
  List<Object> get props => [duration];
}
