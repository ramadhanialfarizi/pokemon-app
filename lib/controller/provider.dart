import 'package:api_learning/model/pokemon_model.dart';
import 'package:api_learning/services/api_service.dart';
import 'package:flutter/material.dart';

enum PokemonListState {
  none,
  loading,
  error,
}

class PokemonListProvider extends ChangeNotifier {
  PokemonListState _state = PokemonListState.none;
  PokemonListState get state => _state;

  final APIservice apiServices = APIservice();
  List<PokemonData> pokemonData = <PokemonData>[];

  void changeState(PokemonListState viewState) {
    _state = viewState;
    notifyListeners();
  }

  void getAllPokemon() async {
    changeState(PokemonListState.loading);

    try {
      pokemonData = await apiServices.getAllPokemon();
      notifyListeners();

      changeState(PokemonListState.none);
    } on Exception catch (e) {
      //log(e.toString());
      changeState(PokemonListState.error);
    }
  }
}
