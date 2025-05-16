import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product.dart';

class ProductService {
  final CollectionReference productsCollection = 
      FirebaseFirestore.instance.collection('products');

 
  Future<String> addProduct(Product product) async {
    try {
      final docRef = await productsCollection.add(product.toMap());
      return docRef.id;
    } catch (e) {
      throw Exception('Failed to add product: $e');
    }
  }

  
  Stream<List<Product>> getProducts() {
    return productsCollection
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return Product.fromMap(
          doc.data() as Map<String, dynamic>,
          doc.id,
        );
      }).toList();
    });
  }

  
  Future<Product> getProductById(String id) async {
    try {
      final docSnapshot = await productsCollection.doc(id).get();
      if (docSnapshot.exists) {
        return Product.fromMap(
          docSnapshot.data() as Map<String, dynamic>,
          docSnapshot.id,
        );
      } else {
        throw Exception('Product not found');
      }
    } catch (e) {
      throw Exception('Failed to get product: $e');
    }
  }

 
  Future<void> updateProduct(String id, Product product) async {
    try {
      await productsCollection.doc(id).update(product.toMap());
    } catch (e) {
      throw Exception('Failed to update product: $e');
    }
  }


  Future<void> deleteProduct(String id) async {
    try {
      await productsCollection.doc(id).delete();
    } catch (e) {
      throw Exception('Failed to delete product: $e');
    }
  }

  
  Stream<List<Product>> searchProducts(String query) {
    return productsCollection
        .where('name', isGreaterThanOrEqualTo: query)
        .where('name', isLessThanOrEqualTo: query + '\uf8ff')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return Product.fromMap(
          doc.data() as Map<String, dynamic>,
          doc.id,
        );
      }).toList();
    });
  }
}