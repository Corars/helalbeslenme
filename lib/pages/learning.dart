import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//Öğrenme Alanı
String calistir() {
  return '';
}

class LearnPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LearnPageState();
  }
}

class LearnPageState extends State<LearnPage> {
  List data;

  @override
  void initState() {
    this.getUrl();
    super.initState();
  }

  Future<String> getUrl() async {
    var response = await http.get(
      Uri.encodeFull('https://rebounce.online/api/time'),
      headers: {'Accept': 'application/json'},
    );
    setState(() {
      data = jsonDecode(response.body)['time'];
    });
    return 'başarılı';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learning'),
      ),
      body: Container(
        child: Center(
          child: Text(data.toString()),
        ),
      ),
    );
  }
}
