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

// Dark Mode provider,con un valor boolean default: false.
// metodo toggleDrakMode() que cambia el valor del estado.
@riverpod
class DarkMode extends _$DarkMode {

  @override
  bool build() {
    return false;
  }

  void toggleDarkMode() {
    state = !state;
  }
}

// Username state provider manejara un String con un valor por default y tendra
// un metodo para cambiar el valor del estado, llamado "changeName( String name )"
@riverpod
class Username extends _$Username {
  String name = 'Mariano Herrera';

  @override
  String build() {
    return name;
  }

  void changeName(String name) {
    state = name;
  }
}
