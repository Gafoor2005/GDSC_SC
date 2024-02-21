import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gdsc_sc/auth_controller.dart';
import 'package:gdsc_sc/types.dart';

class AddProduct extends ConsumerStatefulWidget {
  const AddProduct({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddProductState();
}

class _AddProductState extends ConsumerState<AddProduct> {
  late TextEditingController titleController;
  late TextEditingController descController;
  late TextEditingController priceController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    descController = TextEditingController();
    priceController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    descController.dispose();
    priceController.dispose();
  }

  addItem() {
    CollectionReference productsRef =
        FirebaseFirestore.instance.collection("Products");
    Product p = Product(
      seller: ref.watch(userProvider)!.name,
      emial: ref.watch(userProvider)!.email,
      title: titleController.text,
      desc: descController.text,
      price: int.parse(priceController.text),
    );
    log(p.toMap().toString());
    final data = p.toMap();
    productsRef.add(data);
  }

  void onTap(WidgetRef ref, BuildContext context) async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(withData: true);
    if (result != null) {
      PlatformFile file = result.files.first;
      print(file.extension);
      final time = DateTime.now().millisecondsSinceEpoch.toString();

      final storageRef =
          FirebaseStorage.instance.ref('uploads/${time}.${file.extension}');
      log(file.toString());
      await storageRef.putData(file.bytes!);
      final attachment = await storageRef.getDownloadURL();
    } else {
      log('not seleted photo');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("add Product")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () => onTap(ref, context),
                child: Container(
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
              ),
              const SizedBox(
                height: 10,
              ),
              MyTextField(
                ctrl: titleController,
                labeltext: "enter title",
              ),
              MyTextField(
                ctrl: descController,
                labeltext: "enter description",
                multi: true,
              ),
              MyTextField(
                ctrl: priceController,
                labeltext: "set Price",
                kb: TextInputType.number,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      addItem();
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
  final TextEditingController ctrl;
  final TextInputType? kb;
  final bool? multi;
  const MyTextField({
    super.key,
    required this.labeltext,
    this.kb,
    required this.ctrl,
    this.multi,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        minLines: (multi ?? false) ? 2 : null,
        maxLines: (multi ?? false) ? 4 : null,
        controller: ctrl,
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
