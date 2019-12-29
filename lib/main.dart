//Future Builder
//- https://www.youtube.com/watch?v=ek8ZPdWj4Qo#action=share
//JSON GET API
//- https://medium.com/flutter-community/working-with-apis-in-flutter-8745968103e9
//- https://github.com/PoojaB26/ParsingJSON-Flutter/blob/master/lib/main.dart
import 'package:flutter/material.dart';
import 'services.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: Home(title:"api demo"),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();

}
class _HomeState extends State<Home> {
  int pressed = 0;

  callAPI() {
    pressed++;
    PostPut post = PostPut(
      writings: [Writing(
        timestamp: DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now()),
        lightstart: 6,
        lightend: 21,
        humidity: 60,
        temp: 40,
        waterfreq: 600,
        nutrientratio: 60,
        baselevel: 30,
      ),
      ],
    );
    createPost(post).then((response){
      if(response.statusCode > 200)
        print(response.body);
      else
        print(response.statusCode);
    }).catchError((error){
      print('error : $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold (
      appBar: new AppBar(
        title: Text('ZotPonics API Testing'),
      ),
      body:
        FutureBuilder<PostGet> (
          future: getPost(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text("Error");
              }
              return Center(
                child: Column(
                  children: <Widget>[
                    Text('pressed: $pressed'),
                    Text('baseLevel: ${snapshot.data.readings.last.baseLevel}'),
                    Text('humidity: ${snapshot.data.readings.last.humidity}'),
                    Text('lastWateredTimestamp: ${snapshot.data.readings.last.lastWateredTimestamp}'),
                    Text('lightStatus: ${snapshot.data.readings.last.lightStatus}'),
                    Text('plantHeight: ${snapshot.data.readings.last.plantHeight}'),
                    Text('timestamp: ${snapshot.data.readings.last.timestamp}'),
                  ],
                ),
              );
            }
            else
              return CircularProgressIndicator();
          }
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () { setState(() { callAPI(); }); },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
