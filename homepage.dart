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
