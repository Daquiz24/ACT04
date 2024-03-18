import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'variable.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<dynamic>? data;
  String? name;
  String? country;
  String? gender;
 String? email;
  String? username;
  String? phoneNumber;
  String? nat;
  String? street;
  String? city;
  String? state;
 String? postcode;
  String? latitude;
  String? longitude;
  String? timezoneOffset;
  String? timezoneDescription;
  String? dobDate;
  String? dobAge;
  String? registeredDate;
  String? registeredAge;
  String? cell;
  String? idName;
  String? idValue;
// Rest of your code
  // Initialize data as List<dynamic> or null.

  @override
  void initState() {
    super.initState();
    data = []; // Initialize data as empty list.
    getData(); // Call getData when the widget initializes.
  }
  
  Future<void> getData() async {
    try {
      final response = await http.get(Uri.parse(url)).timeout(Duration(seconds: 3));
      print("connected");

      if (response.statusCode == 200) {
        setState(() {
          data = [jsonDecode(response.body)];
        });
 print(data![0]['results'][0]['phone']);
        String image = data![0]['results'][0]['picture']['large'];
        setState(() {

          name = data![0]['results'][0]['name']['title'] + '. ' + data![0]['results'][0]['name']['first'] +' '+ data![0]['results'][0]['name']['last'];
          country = data![0]['results'][0]['location']['country'];
          gender = data![0]['results'][0]['gender'];
          email = data![0]['results'][0]['email'];
