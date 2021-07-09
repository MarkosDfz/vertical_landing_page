
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vertical_landing_page/providers/page_provider.dart';

import 'package:vertical_landing_page/router/router.dart';

void main() {
  Flurorouter.configureRoutes();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider( create: (_) => new PageProvider() )
      ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Landing Page',
      initialRoute: '/home',
      onGenerateRoute: Flurorouter.router.generator,
    );
  }
}