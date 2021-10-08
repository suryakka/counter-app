import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  @override
  CounterState get initialState => CounterInitial();

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    switch (event.runtimeType) {
      case Increment:
        yield* _mapIncrementToState(event);
        break;
      case Decrement:
        yield* _mapDecrementToState(event);
        break;
      case Reset:
        yield* _mapResettToState(event);
        break;
      case Input:
        yield* _mapInputToState(event);
        break;
    }
  }

  _mapIncrementToState(CounterEvent event) {}
  _mapDecrementToState(CounterEvent event) {}
  _mapResettToState(CounterEvent event) {}
  _mapInputToState(CounterEvent event) {}
}
