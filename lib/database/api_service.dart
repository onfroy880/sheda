// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;


class ApiServices {
  static const String urlap = 'http://192.168.43.147:8000/api';

  ///////////////////////////////// EVENTS METHODS /////////////////////////////////

  // fonctin to get all event list =||= method get
  static Future getEventList() async {
    String url = '$urlap/event';
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
    );
    final data = json.decode(response.body);
    return data;
  }

  // function to read specific event =||= method get
  static Future readEvent(int id) async {
    String url = '$urlap/event/$id';
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
    );
    final data = json.decode(response.body);
    return data;
  }

  //function to search event =||= method post
  static Future filterEvent(String libelle) async {
    String url = '$urlap/comment<id>';
    http.Response response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({}),
    );
    if (response.statusCode == 201) {
    } else {}
  }

  ///////////////////////////////// MESSES METHODS /////////////////////////////////
  // function to get all masse list
  static Future getMesseList() async {
    String url = '$urlap/messe';
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
    );
    final data = json.decode(response.body);
    return data;
  }

  // function to read specific masse
  static Future readMesse(int id) async {
    String url = '$urlap/messe/$id';
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
    );
    final data = json.decode(response.body);
    return data;
  }

  // function to get all comment about specifique masse =||= method post
  static Future getCommentList(int id) async {
    String url = '$urlap/comment<id>';
    http.Response response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({}),
    );
  }
}
