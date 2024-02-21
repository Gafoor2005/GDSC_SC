import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gdsc_sc/types.dart';

final productProvider = StreamProvider((ref) {
  final pr = ProductRepo();
  return pr.fetchProducts();
});

class ProductRepo {
  Stream<List<Product>> fetchProducts() {
    return FirebaseFirestore.instance.collection("Products").snapshots().map(
          (event) => event.docs
              .map(
                (e) => Product.fromMap(e.data()),
              )
              .toList(),
        );
  }
}
