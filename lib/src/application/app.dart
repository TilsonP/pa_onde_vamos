import 'package:flutter/material.dart';
import 'package:pa_onde_vamos/src/presentation/buscar_localizacion.dart';
import 'package:pa_onde_vamos/src/presentation/home_page.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/buscar',
      routes: {
        '/' : (BuildContext context) => HomePage(),
        '/buscar': (BuildContext context) => BuscarLocalizacion()
      },
    );
  }
}