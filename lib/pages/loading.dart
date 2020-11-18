import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    //create instance of worldtime class
    WorldTime instance = WorldTime(
        location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    //run the getTime function to get the time
    //we use await to wait for the function to get the data
    await instance.getTime();
    //this replaces the loading route with the home route
    //we use the arguments paramater to transfer the data
    //to the home screen
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  //creates initial state when we first go to this page
  void initState() {
    super.initState();
    //call the funtion that will give us the time
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitCubeGrid(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
