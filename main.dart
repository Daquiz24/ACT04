import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:api/homepage.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key});

  @override
  State<Loading> createState() => _LoadingState();
}
