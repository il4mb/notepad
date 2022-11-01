import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BerandaScreen extends StatefulWidget {
  const BerandaScreen({super.key});

  @override
  State<BerandaScreen> createState() => _BerandaScreenState();
}

class _BerandaScreenState extends State<BerandaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'NOTEAPP',
          style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600
          ),
        ),
        leading: const BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.deepOrange,
        elevation: 1,
      ),
      body: SafeArea(
        child: Form(
          child: ListView(
            children: [
              TextField(
                style: TextStyle(color: Colors.black26),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none
                  ),
                  hintText: "Search..",
                  prefixIcon: Icon(Icons.search),
                  prefixIconColor: Colors.deepOrange,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}