import 'package:counter_app/presentation/bloc/counter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Counter state', () {
    test('should return CounterInitial', () {
      final state = CounterInitial();
      final listProps = [];
      expect(state, isA<CounterInitial>());
      expect(state, isA<CounterState>());
      expect(state.props, listProps);
    });
    test('should return CounterLoaded', () {
      final state = CounterLoaded(2);
      final listProps = [2];
      expect(state, isA<CounterLoaded>());
      expect(state, isA<CounterState>());
      expect(state.props, listProps);
    });
  });
}
