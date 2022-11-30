import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FileEmptyScreen extends StatelessWidget {
  const FileEmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('You dont have a favorite pokemon'),
    );
  }
}
