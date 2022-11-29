import 'dart:convert';

import 'package:api_learning/model/pokemon_model.dart';
import 'package:dio/dio.dart';

class APIservice {
  Future<List<PokemonData>> getAllPokemon() async {
    try {
      final response = await Dio().get(
          'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json');

      //log(response.data);

      if (response.statusCode == 200) {
        List<dynamic> pokemonData = jsonDecode(response.data)['pokemon'];

        List<PokemonData> pokemonList = [];
        for (int loop = 0; loop < pokemonData.length; loop++) {
          pokemonList.add(PokemonData.fromJson(pokemonData[loop]));
        }
        return pokemonList;
      } else {
        throw Exception('failed to load data');
      }
    } catch (e) {
      rethrow;
    }
  }
}
