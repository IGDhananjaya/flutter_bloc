import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<String, int> {
  int _counter = 0; // Private variable to store the counter

  // Getter to access the counter value
  int get counter => _counter;

  CounterBloc() : super(0) {
    // Registering event handlers for 'add' and 'minus'
    on<String>((event, emit) {
      if (event == 'add') {
        _counter++; // Increment the counter for 'add' event
      } else if (event == 'minus') {
        _counter--; // Decrement the counter for 'minus' event
      }
      emit(_counter); // Emit the updated counter value
    });
  }
}
