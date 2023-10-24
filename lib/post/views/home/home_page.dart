import 'package:bloc_infiniti_list/post/views/home/widgets/body.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static String routeName = "/home";
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Posts'),
        centerTitle: true,
      ),
      body: const Body(),
    );
  }
}
