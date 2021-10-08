import 'package:counter_app/presentation/bloc/counter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Counter event', () {
    test('should return Increment', () {
      final event = Increment(1);
      final listProps = [1];
      expect(event, isA<Increment>());
      expect(event, isA<CounterEvent>());
      expect(event.props, listProps);
    });
    test('should return Decrement', () {
      final state = Decrement(1);
      final listProps = [1];
      expect(state, isA<Decrement>());
      expect(state, isA<CounterEvent>());
      expect(state.props, listProps);
    });
    test('should return Reset', () {
      final state = Reset();
      final listProps = [];
      expect(state, isA<Reset>());
      expect(state, isA<CounterEvent>());
      expect(state.props, listProps);
    });
    test('should return Decrement', () {
      final state = Input(2);
      final listProps = [2];
      expect(state, isA<Input>());
      expect(state, isA<CounterEvent>());
      expect(state.props, listProps);
    });
  });
}
