import 'package:flutter/material.dart';
import 'package:personas_vacant/src/bloc/provider.dart';
import 'package:personas_vacant/src/pages/home_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderBloc(
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Personas Vacant',
        home: HomePage()
      ),
    );
  }
}