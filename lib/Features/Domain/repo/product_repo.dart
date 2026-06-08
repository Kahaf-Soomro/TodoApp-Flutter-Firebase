import 'package:todolist/Features/Domain/model/product.dart';

abstract class ProductRepo {
Future <List<Product>> getAllProducts() ;
Future<void> addProduct(Product product) ;
Future<void> deleteProduct(String id);
 Future<void> toggleProduct(String id, bool value);
} 