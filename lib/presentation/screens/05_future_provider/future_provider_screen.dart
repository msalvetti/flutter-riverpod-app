import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/presentation/providers/providers.dart';

class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final pokemonName = ref.watch(pokemonNameProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Provider'),
      ),
      body: Center(
        child: pokemonName.when(
          data: (data) => Text(data),
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => Text('Error: $error'),
         ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        
        children: [
          FloatingActionButton(
            heroTag: 'next',
            child: const Icon( Icons.arrow_forward_rounded ),
            onPressed: () {
              ref.read(pokemonIdProvider.notifier).nextPokemon();
              },
          ),
          const SizedBox(height: 12),
           FloatingActionButton(
               heroTag: 'previous',
            child: const Icon( Icons.arrow_back_rounded ),
            onPressed: () {
              ref.read(pokemonIdProvider.notifier).previousPokemon();
              },
          ),

        ],
      ),
    );
  }
}