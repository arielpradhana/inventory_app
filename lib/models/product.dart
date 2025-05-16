import 'package:cloud_firestore/cloud_firestore.dart';


class Product {
  String? id;
  String name;
  String category;
  double price;
  int stock;
  String description;
  String? imageUrl;
  DateTime createdAt;

  Product({
    this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.stock,
    required this.description,
    this.imageUrl,
    required this.createdAt,
  });

 
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'category': category,
      'price': price,
      'stock': stock,
      'description': description,
      'imageUrl': imageUrl,
      'createdAt': createdAt,
    };
  }

  
  factory Product.fromMap(Map<String, dynamic> map, String docId) {
    return Product(
      id: docId,
      name: map['name'] ?? '',
      category: map['category'] ?? '',
      price: (map['price'] ?? 0.0).toDouble(),
      stock: map['stock'] ?? 0,
      description: map['description'] ?? '',
      imageUrl: map['imageUrl'],
      createdAt: (map['createdAt'] as Timestamp).toDate(),
    );
  }
}