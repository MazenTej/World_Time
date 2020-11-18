import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //a map object where we will store the values we had
  //from the loading page
  Map data = {};
  @override
  Widget build(BuildContext context) {
    //we use ModalRoute to store the data we recieved from the laoding
    //page in the map object data
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);

    //set background
    String bgImage = data['isDaytime'] ? 'day.png' : 'night.png';
    Color bgColor = data['isDaytime'] ? Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.fitHeight,
          )),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () async {
                    //pressing the button pushes us to the location page
                    //we consdier going to the locations page and coming back to
                    //the home page as one async task and we store the result in result
                    dynamic result =
                        await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDaytime': result['isDaytime'],
                        'flag': result['flag'],
                      };
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[300],
                  ),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(
                      color: Colors.grey[300],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28,
                        letterSpacing: 2,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 66,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
