import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/config/config.dart';

import '../../providers/providers.dart';


class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
   
    final counter = ref.watch(counterProvider);

    final isDarkMode = ref.watch(darkModeProvider);

    final username = ref.watch(usernameProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('State Provider'),
      ),
      body: Center(
        child: Column(
          children: [
            const Spacer(flex: 1,),

          //miramos el valor del darkModeProvider para definir si es TRUE utilizamos el icono light_mode_outlined 
          //si es FALSE utilizamos el icono dark_mode_outlined
            IconButton(
              icon: Icon( 
                isDarkMode 
                ? Icons.dark_mode_outlined 
                : Icons.light_mode_outlined, 
                size: 100 ),
              onPressed: () {
                ref.read(darkModeProvider.notifier).toggleDarkMode();
              },
            ), 
            

            //mostrar el valor del usernameProvider en un Text
            Text( username, style: const TextStyle(fontSize: 25 )            
             ),

            TextButton.icon(
              icon: const Icon( Icons.add, size: 50,),
              label: Text('$counter', style: const TextStyle(fontSize: 100)),
              onPressed: () {
                ref.read(counterProvider.notifier).increment();
              },
            ),
            
            const Spacer( flex: 2 ),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Nombre aleatorio'),
        icon: const Icon( Icons.refresh_rounded ),
        onPressed: () {
          ref.read(usernameProvider.notifier).changeName(RandomGenerator.getRandomName());
        },
      ),
    );
  }
}