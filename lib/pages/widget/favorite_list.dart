// this file not have connection with another file in this project!!!

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FavoriteList extends StatelessWidget {
  const FavoriteList({super.key, this.name, this.image, this.spawnTime});
  final String? name;
  final String? image;
  final String? spawnTime;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(image!),
        title: Text(name!),
        subtitle: Row(
          children: [
            Text('Spawn time : '),
            Text(spawnTime!),
          ],
        ),
        // title: Text(Contact().contacts[index].name),
        // subtitle: Text(Contact().contacts[index].phoneNumber),
      ),
    );
  }
}
