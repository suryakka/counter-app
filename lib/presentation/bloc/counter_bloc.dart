import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

@injectable
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

  Stream<CounterState> _mapIncrementToState(Increment event) async* {
    yield CounterLoaded(event.input + 1);
  }

  Stream<CounterState> _mapDecrementToState(Decrement event) async* {
    yield CounterLoaded(event.input - 1);
  }

  Stream<CounterState> _mapResettToState(Reset event) async* {
    yield CounterLoaded(0);
  }

  Stream<CounterState> _mapInputToState(Input event) async* {}
}
