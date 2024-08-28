import 'package:flutter/material.dart';
import 'package:grocery/res/utils/grocerylist.dart';
import 'package:grocery/view/home/homeview.dart';
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
    final size = MediaQuery.sizeOf(context);
    final homePRovider = Provider.of<Homeviewmodel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Column(
        children: [
          Consumer<Homeviewmodel>(
            builder: (context, value, child) => Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: value.cartlist.length,
                itemBuilder: (context, index) => Card(
                  child: Container(
                    child: Row(
                      children: [
                        Image.asset(
                          value.cartlist[index].imgurl,
                          height: 100,
                          width: 100,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(value.cartlist[index].itemname),
                            Text(value.cartlist[index].itemprice),
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {
                              homePRovider.removecart(value.cartlist[index]);
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.white,
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            width: size.width,
            decoration: const BoxDecoration(color: Colors.blueGrey),
            child: Row(
              children: [
                const Text(
                  "Total",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                ElevatedButton.icon(
                    iconAlignment: IconAlignment.end,
                    icon: const Icon(
                      Icons.arrow_forward_sharp,
                      color: Colors.black,
                    ),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Homeview()));
                    },
                    label: const Text(
                      "Check Out",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
