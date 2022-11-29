import 'package:api_learning/controller/provider.dart';
import 'package:api_learning/model/pokemon_model.dart';
import 'package:api_learning/pages/fail_load_error/fail_load_error.dart';
import 'package:api_learning/pages/favorite_page.dart';
import 'package:api_learning/pages/widget/pokemon_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final prov = Provider.of<PokemonListProvider>(context, listen: false);
      prov.getAllPokemon();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text(
            'Pokemon App',
            style: TextStyle(
              color: Colors.black,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: TabBar(
            labelColor: Colors.black,
            indicatorPadding: const EdgeInsets.only(top: 25),
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            tabs: [
              Tab(
                text: 'PokeList',
              ),
              Tab(
                text: 'Favorite',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            PokelistScreen(),
            FavoritePage(),
          ],
        ),
      ),
    );
  }
}
