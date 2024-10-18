part of 'counter_cubit.dart';

@immutable
class CounterState {
  final int counter;
  final String? status;
  const CounterState({required this.counter, this.status});
}

final class CounterInitial extends CounterState {
  const CounterInitial() : super(counter: 0, status: "Genap");
}
