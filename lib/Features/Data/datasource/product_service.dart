import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todolist/Features/Domain/model/product.dart';

class ProductService {


final FirebaseFirestore _firestore = FirebaseFirestore.instance;

CollectionReference get _productsRef=> _firestore.collection('products');

Future <List<Product>> getAllProducts() async {
  try {
    final snapshot = await _productsRef.get();
    return snapshot.docs.map((p) {
      return Product.fromMap(p.data() as Map<String, dynamic>);
    }).toList();
  } catch (e) {
    print('Error fetching products: $e');
    return [];
  }
  // final snapshot = await _productsRef.get();
  // return snapshot.docs.map((doc) => Product.fromFirestore(doc)).toList();
}




Future<void> addProduct(Product product) async {
  try {
    await _productsRef.doc(product.id).set(product.toMap());
  } catch (e) {
    print('Error adding product: $e');
  }
}

//Delete existing product

Future<void> deleteProduct(String id) async {
  try {
    await _productsRef.doc(id).delete();
  } catch (e) {
    print('Error deleting product: $e');
  }}



Future<void> toggleProduct(String id, bool value) async {
  try { 
      await _productsRef.doc(id).update({'isCompleted': value});
    } catch (e) {
      print('Error updating product: $e');
    }

}}  