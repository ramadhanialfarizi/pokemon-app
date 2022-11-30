import 'package:api_learning/pages/widget/favorite_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _usersStream =
        FirebaseFirestore.instance.collection('users').snapshots();
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('users');
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          //scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: StreamBuilder<QuerySnapshot>(
              stream: _usersStream,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  return ListView(
                    shrinkWrap: true,
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;

                      String image = data['image'];
                      String name = data['name'];
                      String spawnTime = data['spawnTime'];
                      return Card(
                        child: ListTile(
                          leading: Image.network(image),
                          title: Text(name),
                          subtitle: Row(
                            children: [
                              const Text('Spawn time : '),
                              Text(spawnTime),
                            ],
                          ),
                          // title: Text(Contact().contacts[index].name),
                          // subtitle: Text(Contact().contacts[index].phoneNumber),
                        ),
                      );
                    }).toList(),
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                } else {
                  return Center(
                    child: Text('Something went wrong! data not loaded'),
                  );
                }
              },
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

}
