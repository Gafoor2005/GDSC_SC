import 'package:flutter/material.dart';
import 'package:gdsc_sc/payment.dart';

class Overview extends StatelessWidget {
  const Overview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black45,
                    ),
                    clipBehavior: Clip.hardEdge,
                    // height: 50,
                    child: Image.asset(
                      "assets/waste.jpeg",
                      height: 189,
                      width: 336,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Plastic recycleable water bottels",
                        style: TextStyle(
                          fontSize: 20,
                          height: 1.2,
                        ),
                        maxLines: 2,
                      ),
                      Text(
                        "these are plastic bottels which are too old. so i decided to throw them, but if i sell them for reuse by recycling i can save this world from being polluted.",
                        style: TextStyle(overflow: TextOverflow.ellipsis),
                        maxLines: 2,
                      ),
                      Text(
                        "Rs. 200",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text("Seller: Mr xyz"),
                      Text("From Hydrabad"),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 18.0, horizontal: 10),
              child: Column(
                children: [
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Rs. 200",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Payment()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text("Buy now"),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
