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
            username = data![0]['results'][0]['login']['username'];
          phoneNumber = data![0]['results'][0]['phone'];
          nat = data![0]['results'][0]['nat'];
          street = data![0]['results'][0]['location']['street']['name'];
          city = data![0]['results'][0]['location']['city'];
          state = data![0]['results'][0]['location']['state'];
          postcode = data![0]['results'][0]['location']['postcode'].toString();
           latitude = data![0]['results'][0]['location']['coordinates']['latitude'];
          longitude = data![0]['results'][0]['location']['coordinates']['longitude'];
          timezoneOffset = data![0]['results'][0]['location']['timezone']['offset'];
          timezoneDescription = data![0]['results'][0]['location']['timezone']['description'];
          dobDate = data![0]['results'][0]['dob']['date'];
          dobAge = data![0]['results'][0]['dob']['age'].toString();
          registeredDate = data![0]['results'][0]['registered']['date'];
         registeredAge = data![0]['results'][0]['registered']['age'].toString();
          cell = data![0]['results'][0]['cell'];
          idName = data![0]['results'][0]['id']['name'];

        });
      } else {

        throw Exception('Failed to load data: ${response.statusCode}');
      }

      await Future.delayed(Duration(seconds: 3));
    } catch(e) {
      print(e);
      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Text('Message'),
          content: Text('Failed to fetch data. Please check your internet connection.'),
          actions: [
 TextButton(onPressed: (){
              getData();
              Navigator.pop(context);
            }, child: Text('Retry'))
          ],
        );
      });
    }
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        title: Text('Home'),
        centerTitle: true,
      ),
  body: RefreshIndicator(
        child: ListView(
          children: [
            if (data != null && data!.isNotEmpty) // Check if data is not null and not empty.
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
     

        
