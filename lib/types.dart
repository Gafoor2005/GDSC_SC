// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Product {
  final String? photoUrl;
  final String title;
  final String desc;
  final String seller;
  final String emial;
  final int price;
  final List<String>? categories;
  Product({
    this.photoUrl,
    required this.title,
    required this.desc,
    required this.seller,
    required this.emial,
    required this.price,
    this.categories,
  });

  Product copyWith({
    String? photoUrl,
    String? title,
    String? desc,
    String? seller,
    String? emial,
    int? price,
    List<String>? categories,
  }) {
    return Product(
      photoUrl: photoUrl ?? this.photoUrl,
      title: title ?? this.title,
      desc: desc ?? this.desc,
      seller: seller ?? this.seller,
      emial: emial ?? this.emial,
      price: price ?? this.price,
      categories: categories ?? this.categories,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'photoUrl': photoUrl,
      'title': title,
      'desc': desc,
      'seller': seller,
      'emial': emial,
      'price': price,
      'categories': categories,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      photoUrl: map['photoUrl'] != null ? map['photoUrl'] as String : null,
      title: map['title'] as String,
      desc: map['desc'] as String,
      seller: map['seller'] as String,
      emial: map['emial'] as String,
      price: map['price'] as int,
      categories: map['categories'] != null
          ? List<String>.from((map['categories'] as List<String>))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product(photoUrl: $photoUrl, title: $title, desc: $desc, seller: $seller, emial: $emial, price: $price, categories: $categories)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;

    return other.photoUrl == photoUrl &&
        other.title == title &&
        other.desc == desc &&
        other.seller == seller &&
        other.emial == emial &&
        other.price == price &&
        listEquals(other.categories, categories);
  }

  @override
  int get hashCode {
    return photoUrl.hashCode ^
        title.hashCode ^
        desc.hashCode ^
        seller.hashCode ^
        emial.hashCode ^
        price.hashCode ^
        categories.hashCode;
  }
}
