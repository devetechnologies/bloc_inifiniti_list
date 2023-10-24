import 'package:bloc_infiniti_list/helpers/routs.dart';
import 'package:bloc_infiniti_list/post/views/view.dart';
import 'package:flutter/material.dart';

import 'helpers/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bloc List',
      theme: themeData(),
      initialRoute: HomePage.routeName,
      routes: routes,
    );
  }
}
