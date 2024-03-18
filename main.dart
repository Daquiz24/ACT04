import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:api/homepage.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Future<void> getData() async {
    try {
      final response =
      await http.get(Uri.parse(url)).timeout(Duration(seconds: 6));
      print("connected");
      data = [jsonDecode(response.body)];
      print(data[0]['results'][0]['name']['first']);
      await Future.delayed(Duration(seconds: 3));
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => Homepage()));
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Message'),
            content: Text('No internet connection'),
            actions: [
              TextButton(
                onPressed: () {
                  getData();
                  Navigator.pop(context);
                },
                child: Text('Retry'),
              )
            ],
          );
        },
      );
    }
  }

@override
  void initState() {
    getData(); 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
return Scaffold(
      backgroundColor: Colors.white, // Set background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
            Image.network(
              'https://cdn.dribbble.com/users/2153417/screenshots/5894065/loading_circle.gif',
              width: 100, 
              height: 100, 
            ),
            SizedBox(height: 20), 
            Text(
              'Fetching Data...',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
            SizedBox(height: 20), 
            LinearProgressIndicator(
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}



