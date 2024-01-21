import 'package:flutter/material.dart';
import 'package:gdsc_sc/add_product.dart';
import 'package:gdsc_sc/overview.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 226, 215, 215),
      appBar: AppBar(
        leading:
            IconButton.filledTonal(onPressed: () {}, icon: Icon(Icons.menu)),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        title: const Text("waste"),
        titleSpacing: 0,
        elevation: 2,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.person_outline_rounded))
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverList.list(
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: Text(
                  "Cantogeries",
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    Card(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          " All ",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      color: Colors.green[900],
                    ),
                    Card(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("organic"),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("plastic"),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("paper"),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("e-waste"),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("metal"),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Glass"),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: SliverGrid.count(
              crossAxisSpacing: 5,
              mainAxisSpacing: 8,
              crossAxisCount: 2,
              childAspectRatio: .8,
              children: const [
                ItemCard(),
                ItemCard(),
                ItemCard(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const AddProduct()));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(),
      child: GestureDetector(
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Overview())),
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 238, 255, 234),
          ),
          // width: 166,
          clipBehavior: Clip.hardEdge,
          height: 220,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black26,
                ),
                clipBehavior: Clip.hardEdge,
                // height: 50,
                child: Image.asset(
                  "assets/waste.jpeg",
                  // width: 150,
                  // height: 100,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "waste plastic 2kgs water bottels",
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  height: 1.2,
                ),
                maxLines: 2,
              ),
              const Spacer(
                flex: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Rs. 200",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
