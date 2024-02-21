import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:gdsc_sc/add_product.dart';
import 'package:gdsc_sc/auth_controller.dart';
import 'package:gdsc_sc/my_account.dart';
import 'package:gdsc_sc/overview.dart';
import 'package:gdsc_sc/product_repo.dart';
import 'package:gdsc_sc/types.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 215, 215),
      appBar: AppBar(
        leading: IconButton.filledTonal(
            onPressed: () {}, icon: const Icon(Icons.menu)),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Text("waste"),
        titleSpacing: 0,
        elevation: 2,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const MyAccount()));
              },
              icon: const Icon(Icons.person_outline_rounded))
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverList.list(
            children: [
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: Text(
                  "Cantogeries",
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 8,
                    ),
                    Card(
                      color: Colors.green[900],
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          " All ",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const Card(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("organic"),
                      ),
                    ),
                    const Card(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("plastic"),
                      ),
                    ),
                    const Card(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("paper"),
                      ),
                    ),
                    const Card(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("e-waste"),
                      ),
                    ),
                    const Card(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("metal"),
                      ),
                    ),
                    const Card(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Glass"),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: ref.watch(productProvider).when(
                  data: (data) {
                    return SliverGrid.builder(
                      itemCount: data.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 8,
                        crossAxisCount: 2,
                        childAspectRatio: .8,
                      ),
                      itemBuilder: (context, index) => ItemCard(p: data[index]),
                    );
                  },
                  error: (error, stackTrace) => SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) =>
                          Text("some error occured\n${error.toString()}"),
                    ),
                  ),
                  loading: () => SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => const CircularProgressIndicator(),
                    ),
                  ),
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
  final Product p;
  const ItemCard({
    Key? key,
    required this.p,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(),
      child: GestureDetector(
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Overview(p: p))),
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
              Text(
                p.title,
                style: const TextStyle(
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
                  Text(
                    "Rs. ${p.price}",
                    style: const TextStyle(
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
