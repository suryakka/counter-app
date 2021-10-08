part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

class Increment extends CounterEvent {
  final int input;

  Increment(this.input);
  @override
  List<Object> get props => [input];
}

class Decrement extends CounterEvent {
  final int input;

  Decrement(this.input);
  @override
  List<Object> get props => [input];
}

class Reset extends CounterEvent {}

class Input extends CounterEvent {
  final int input;

  Input(this.input);
  @override
  List<Object> get props => [input];
}
