//Generated with: https://app.quicktype.io/
// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

String url = 'http://10.10.10.185:5000/recentsensordata';

Future<Post> getPost() async{
  final response = await http.get('$url');
  return postFromJson(response.body);
}

Post postFromJson(String str) => Post.fromJson(json.decode(str));

//String postToJson(Post data) => json.encode(data.toJson());

class Post {
  List<Reading> readings;

  Post({
    this.readings,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    readings: List<Reading>.from(json["readings"].map((x) => Reading.fromJson(x))),
  );

//  Map<String, dynamic> toJson() => {
//    "readings": List<dynamic>.from(readings.map((x) => x.toJson())),
//  };
}

class Reading {
  double baseLevel;
  double humidity;
  DateTime lastWateredTimestamp;
  dynamic lightStatus;
  double plantHeight;
  double temperature;
  DateTime timestamp;

  Reading({
    this.baseLevel,
    this.humidity,
    this.lastWateredTimestamp,
    this.lightStatus,
    this.plantHeight,
    this.temperature,
    this.timestamp,
  });

  factory Reading.fromJson(Map<String, dynamic> json) => Reading(
    baseLevel: json["baseLevel"],
    humidity: json["humidity"],
    lastWateredTimestamp: DateTime.parse(json["lastWateredTimestamp"]),
    lightStatus: json["lightStatus"],
    plantHeight: json["plantHeight"],
    temperature: json["temperature"],
    timestamp: DateTime.parse(json["timestamp"]),
  );

//  Map<String, dynamic> toJson() => {
//    "baseLevel": baseLevel,
//    "humidity": humidity,
//    "lastWateredTimestamp": lastWateredTimestamp.toIso8601String(),
//    "lightStatus": lightStatus,
//    "plantHeight": plantHeight,
//    "temperature": temperature,
//    "timestamp": timestamp.toIso8601String(),
//  };
}
