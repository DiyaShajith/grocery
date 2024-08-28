import 'package:flutter/material.dart';
import 'package:grocery/viewmodel/homeviewmodel.dart';
import 'package:provider/provider.dart';

class Cartview extends StatefulWidget {
  const Cartview({super.key});

  @override
  State<Cartview> createState() => _CartviewState();
}

class _CartviewState extends State<Cartview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemBuilder: (context, index) => Consumer<Homeviewmodel>(
                builder: (context, value, child) => Container(
                  child: Row(
                    children: [
                      Image.asset("assets/banana.webp"),
                    ],
                  ),
                ),
              )),
    );
  }
}
