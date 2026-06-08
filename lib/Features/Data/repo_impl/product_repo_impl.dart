import 'package:todolist/Features/Data/datasource/product_service.dart';
import 'package:todolist/Features/Domain/model/product.dart';
import 'package:todolist/Features/Domain/repo/product_repo.dart';

class ProductRepoImpl implements ProductRepo {

  final ProductService _productService;

  ProductRepoImpl(this._productService); 

  @override
  Future<void> addProduct(Product product) {
   return _productService.addProduct(product);
  }

  @override
  Future<void> deleteProduct(String id) {
    return _productService.deleteProduct(id);
  }

  @override
  Future<List<Product>> getAllProducts() {
   
    return _productService.getAllProducts();

  }

  @override
  Future<void> toggleProduct(String id, bool value) {


    return _productService.toggleProduct(id, value); 
  }



}
 