import 'package:bloc_test/bloc_test.dart';
import 'package:counter_app/presentation/bloc/counter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  CounterBloc counterBloc;
  setUp(() {
    counterBloc = CounterBloc();
  });

  group('Counter Bloc Test', () {
    test('initial state', () {
      expect(counterBloc.initialState, CounterInitial());
    });

    blocTest('Increment map event to state test',
        build: () async => counterBloc,
        act: (bloc) => bloc.add(Increment(1)),
        expect: [CounterLoaded(1)]);
    blocTest('Decrement map event to state test',
        build: () async => counterBloc,
        act: (bloc) => bloc.add(Decrement(1)),
        expect: [CounterLoaded(1)]);
  });
}
