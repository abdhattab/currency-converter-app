
import 'package:currency_converter/screens/home_screen.dart';
import 'package:currency_converter/screens/launch_screen.dart';

import 'package:flutter/material.dart';


void main() => runApp(const Currency());

class Currency extends StatefulWidget {
  const Currency({Key? key}) : super(key: key);

  @override
  State<Currency> createState() => _CurrencyState();
}

class _CurrencyState extends State<Currency> {


  @override


  // List of items in our dropdown menu

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'LaunchScreen',
      routes: {
        'HomeScreen':(context) => const HomeScreen(),
        'LaunchScreen':(context)=>const LanuchScreen(),

      },

    );
  }





}
