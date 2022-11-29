import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../controller/provider.dart';
import '../../model/pokemon_model.dart';
import '../fail_load_error/fail_load_error.dart';

class PokelistScreen extends StatefulWidget {
  const PokelistScreen({super.key});

  @override
  State<PokelistScreen> createState() => _PokelistScreenState();
}

class _PokelistScreenState extends State<PokelistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<PokemonListProvider>(
        builder:
            (BuildContext context, PokemonListProvider provider, Widget? _) {
          final isLoading = provider.state == PokemonListState.loading;
          final isError = provider.state == PokemonListState.error;

          if (isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (isError) {
            return const FailLoadScreen();
          } else {
            return Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: provider.pokemonData.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        '/detail',
                        arguments: PokemonData(
                          image: provider.pokemonData[index].image,
                          name: provider.pokemonData[index].name!,
                          height: provider.pokemonData[index].height,
                          weight: provider.pokemonData[index].weight,
                          weakness: provider.pokemonData[index].weakness,
                          spawnChange: provider.pokemonData[index].spawnChange,
                          spawnTime: provider.pokemonData[index].spawnTime,
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 179, 255, 181),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Center(
                              child: Image.network(
                                  provider.pokemonData[index].image!),
                            ),
                            Container(
                              width: 100,
                              height: 25,
                              margin: const EdgeInsets.only(
                                right: 17.0,
                                left: 17.0,
                                bottom: 17.0,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(255, 102, 202, 106),
                              ),
                              child: Center(
                                child: Text(
                                  provider.pokemonData[index].name!,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
