import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/presentation/providers/future_providers.dart';

//vamos a mantener un estado local
class FamilyFutureScreen extends ConsumerStatefulWidget {
  const FamilyFutureScreen({super.key});

  @override
  FamilyFutureScreenState createState() => FamilyFutureScreenState();
}

class FamilyFutureScreenState extends ConsumerState<FamilyFutureScreen> {
  int pokemonId = 3;

  @override
  Widget build(BuildContext context) {

    final pokemonAsync = ref.watch(pokemonProvider(pokemonId));

    return Scaffold(
      appBar: AppBar(
        title: Text('Pokemon id $pokemonId'),
      ),
      body: Center(
        child: pokemonAsync.when(
          data: (pokemon) => Text(pokemon),
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => Text('Error: $error'),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'next',
            child: const Icon(Icons.exposure_minus_1),
            onPressed: () {
              if (pokemonId > 1) {
                pokemonId--;
                setState(() {});
              }
              //  ref.read(pokemonIdProvider.notifier).nextPokemon();
            },
          ),
          const SizedBox(height: 12),
          FloatingActionButton(
            heroTag: 'previous',
            child: const Icon(Icons.exposure_plus_1),
            onPressed: () {
              pokemonId++;
              setState(() {});
              //   ref.read(pokemonIdProvider.notifier).previousPokemon();
            },
          ),
        ],
      ),
    );
  }
}
