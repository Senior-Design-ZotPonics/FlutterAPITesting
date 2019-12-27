//Future Builder
//- https://www.youtube.com/watch?v=ek8ZPdWj4Qo#action=share
//JSON GET API
//- https://medium.com/flutter-community/working-with-apis-in-flutter-8745968103e9
//- https://github.com/PoojaB26/ParsingJSON-Flutter/blob/master/lib/main.dart
import 'package:flutter/material.dart';
import 'services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold (
      appBar: new AppBar(
        title: Text('ZotPonics API Testing'),
      ),
      body:
        FutureBuilder<Post> (
          future: getPost(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text("Error");
              }
              print(snapshot.data.readings.first.baseLevel);
              return Center(
                child: Column(
                  children: <Widget>[
                    Text('baseLevel: ${snapshot.data.readings.first.baseLevel}'),
                    Text('humidity: ${snapshot.data.readings.first.humidity}'),
                    Text('lastWateredTimestamp: ${snapshot.data.readings.first.lastWateredTimestamp}'),
                    Text('lightStatus: ${snapshot.data.readings.first.lightStatus}'),
                    Text('plantHeight: ${snapshot.data.readings.first.plantHeight}'),
                    Text('timestamp: ${snapshot.data.readings.first.timestamp}'),


                  ],
                ),
              );
            }
            else
              return CircularProgressIndicator();
          }
        ),
//      Center(
//        child: Text(
//          "hello",
//          style: TextStyle(
//              fontWeight: FontWeight.bold,
//              fontSize: 30
//          ),
//        ),
//      ),
    );
  }
}
