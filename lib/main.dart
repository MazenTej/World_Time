import 'package:flutter/material.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';

void main() => runApp(MaterialApp(
      //shows the initial route when we load up the app
      initialRoute: '/',
      //map of routes
      routes: {
        //function takes context as a pramater which keeps track
        //of where we are in the widget tree
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/location': (context) => ChooseLocation(),
      },
    ));
