import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //location name for the UI
  String time; //the time in that location
  String flag; //url to an asset flag icon
  String url; //location url for API endpoints
  bool isDaytime; //true or false if daytime or not

  //constructor to recieve these values
  WorldTime({this.location, this.flag, this.url});

  //Future is a placehold of value until the fucntion is complete
  Future<void> getTime() async {
    try {
      //request API for time and store it in response
      //use url at the end bc that's the only thing that changes
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$url');
      //use jsonDecode to store the infromation in a map
      Map data = jsonDecode(response.body);
      //store the time as a string
      String datetime = data['datetime'];
      //create a substring that only contains the 1 we are adding
      String offset = data['utc_offset'].substring(1, 3);

      //create a DateTime object
      //parse changes datetime in to a DateTime object
      DateTime now = DateTime.parse(datetime);
      //parse changes the string to an int and we add it
      // to the datetime object
      now = now.add(Duration(hours: int.parse(offset)));

      //isDaytime checks the time to see if it is day or night
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      //we used the intl package that provides DateFormat.jm as a function
      //to format the time
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('caught error: $e');
      time = 'could not get time data';
    }
  }
}
