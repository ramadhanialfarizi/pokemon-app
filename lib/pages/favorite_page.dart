import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          //scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              shrinkWrap: true,
              children: [
                card(),
                card(),
                card(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget card() {
  //   return Card(
  //     child: Row(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Expanded(
  //           flex: 1,
  //           child: Image.network(
  //               'http://www.serebii.net/pokemongo/pokemon/001.png'),
  //         ),
  //         Expanded(
  //           flex: 2,
  //           child: Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
  //                 Text(
  //                   'Pokemon Name',
  //                   style: TextStyle(fontSize: 16.0),
  //                 ),
  //                 SizedBox(
  //                   height: 10,
  //                 ),
  //                 Text('Pokemon'),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget card() {
    return ListTile(
      leading:
          Image.network('http://www.serebii.net/pokemongo/pokemon/001.png'),
      title: Text('Pokemon Name'),
      subtitle: Text('Weakness'),
      // title: Text(Contact().contacts[index].name),
      // subtitle: Text(Contact().contacts[index].phoneNumber),
    );
  }
}
