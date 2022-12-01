import 'package:api_learning/pages/fail_load_error/file_empty.dart';
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
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
        .collection('users')
        .orderBy('name')
        .snapshots();
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
                if (snapshot.hasError) {
                  return FileEmptyScreen();
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(color: Colors.green),
                  );
                } else {
                  return ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;

                      //String? id = data['id'];
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
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  size: 20.0,
                                  color: Colors.brown[900],
                                ),
                                onPressed: () {
                                  // delete Favorite From cloud firestore
                                  users.doc(document.id).delete();
                                },
                              ),
                            ],
                          ),
                          // title: Text(Contact().contacts[index].name),
                          // subtitle: Text(Contact().contacts[index].phoneNumber),
                        ),
                      );
                    }).toList(),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
