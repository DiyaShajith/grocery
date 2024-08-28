import 'package:flutter/material.dart';
import 'package:grocery/res/utils/grocerylist.dart';

class Homeview extends StatefulWidget {
  const Homeview({super.key});

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        actions: const [
          Padding(
            padding: EdgeInsets.all(16),
            child: Icon(
              Icons.shopping_cart_outlined,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Vegetables",
            style: TextStyle(
                color: Colors.green, fontSize: 22, fontWeight: FontWeight.w500),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: grocerylist.length,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  mainAxisExtent: 230),
              itemBuilder: (context, index) => Card(
                child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Image.asset(
                          grocerylist[index].imgurl,
                          width: 150,
                          height: 150,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(grocerylist[index].itemname),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.shopping_cart_outlined,
                              ),
                              color: Colors.white,
                            ),
                            Text(grocerylist[index].itemprice)
                          ],
                        )
                      ],
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
