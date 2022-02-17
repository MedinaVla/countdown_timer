import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../ticker.dart';

part 'countdown_event.dart';
part 'countdown_state.dart';

class CountdownBloc extends Bloc<CountdownEvent, CountdownState> {
  final Ticker _ticker;
  static const int _duration = 60;
  StreamSubscription<int>? _tickerSubscription;
  CountdownBloc({
    required Ticker ticker,
  })  : _ticker = ticker,
        super(const CountdownInitial(_duration)) {
    on<CountdownStarted>(_onStarted);
    on<CountdownPaused>(_onPaused);
    on<CountdownResumed>(_onResumed);
    on<CountdownReset>(_onReset);
    on<CountdownTicked>(_onTicked);
  }
  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  void _onStarted(CountdownStarted event, Emitter<CountdownState> emit) {
    emit(CountdownRunInProgress(event.duration));
    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker
        .tick(ticks: event.duration)
        .listen((duration) => add(CountdownTicked(duration: duration)));
  }

  void _onPaused(CountdownPaused event, Emitter<CountdownState> emit) {
    if (state is CountdownRunInProgress) {
      _tickerSubscription?.pause();
      emit(CountdownRunPause(state.duration));
    }
  }

  void _onResumed(CountdownResumed resume, Emitter<CountdownState> emit) {
    if (state is CountdownRunPause) {
      _tickerSubscription?.resume();
      emit(CountdownRunInProgress(state.duration));
    }
  }

  void _onReset(CountdownReset event, Emitter<CountdownState> emit) {
    _tickerSubscription?.cancel();
    emit(const CountdownInitial(_duration));
  }

  void _onTicked(CountdownTicked event, Emitter<CountdownState> emit) {
    emit(
      event.duration > 0
          ? CountdownRunInProgress(event.duration)
          : const CountdownRunComplete(),
    );
  }
}
