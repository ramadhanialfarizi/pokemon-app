import 'package:api_learning/model/pokemon_model.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final parameter = ModalRoute.of(context)!.settings.arguments as PokemonData;
    String image = parameter.image as String;
    String name = parameter.name as String;
    String height = parameter.height as String;
    String weight = parameter.weight as String;
    String spawnTime = parameter.spawnTime as String;
    String weakness = parameter.weakness as String;
    String spawnChance = parameter.spawnChange as String;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 350.0,
            floating: true,
            stretch: true,
            backgroundColor: Color.fromARGB(255, 100, 220, 104),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Positioned(
                    top: -50,
                    right: -50,
                    child: Image.asset(
                      'assets/images/pokeball.png',
                      width: 200,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Positioned(
                    child: Center(
                      child: Image.network(
                        image,
                        scale: 0.6,
                      ),
                    ),
                  ),
                ],
              ),
              title: Container(
                width: 150,
                height: 30,
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
                    name,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              centerTitle: false,
            ),
          ),
          customSliverList(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Name',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Height',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              height,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Weight',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              weight,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Spawn Time',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              spawnTime,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Weakness',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              weakness,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Spawn Chance',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              spawnChance,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromARGB(255, 100, 220, 104)),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'add to favorite',
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget customSliverList() {
    return SliverToBoxAdapter(
      child: Container(
        color: Color.fromARGB(255, 100, 220, 104),
        height: 20,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              height: 20,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
