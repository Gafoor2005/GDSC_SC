import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("add Product")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    style: BorderStyle.solid,
                    width: 6,
                    color: Colors.black12,
                  ),
                ),
                height: 200,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add_a_photo_outlined),
                    SizedBox(
                      width: 8,
                    ),
                    Text("add a photo"),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const MyTextField(
                labeltext: "enter title",
              ),
              const MyTextField(
                labeltext: "enter description",
              ),
              const MyTextField(
                labeltext: "set Price",
                kb: TextInputType.number,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text("add"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  final String labeltext;
  final TextInputType? kb;
  const MyTextField({super.key, required this.labeltext, this.kb});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        keyboardType: kb,
        decoration: InputDecoration(
          labelText: labeltext,
          fillColor: Colors.green[200],

          // filled: true,
          contentPadding: const EdgeInsets.all(20),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(),
            borderRadius: BorderRadius.circular(10),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
