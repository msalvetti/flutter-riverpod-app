// voy a crear una clase simple para el estado de un contador.
// Esta clase va a extender de StateNotifier y va a tener un estado de tipo int.

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'state_providers.g.dart';

@riverpod
class Counter extends _$Counter {
 
  @override
  int build() {
    return 5;
  }

  void increment() {
    state++;
  }

  void decrement() {
    state--;
  }
}
