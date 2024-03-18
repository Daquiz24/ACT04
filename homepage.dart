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
