import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todolist/Features/Domain/model/product.dart';
import 'package:todolist/Features/Domain/repo/product_repo.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepo repo;
  ProductBloc( this.repo) : super(ProductState()) {
    on<LoadProductsEvent>(_onLoadProductsEvent);
    on<AddProductEvent>(_onAddProductsEvent);
    on<DeleteProductEvent>(_onDeleteProductsEvent);
    on<ToggleProductEvent>(_onToggleProductsEvent);
         
  }


  Future<void> _onLoadProductsEvent(LoadProductsEvent event, Emitter<ProductState> emit) async {
  emit(state.copyWith(productStatus: ProductStatus.loading));
  try{
final data = await repo.getAllProducts();
emit(state.copyWith(productStatus: ProductStatus.success, products: data));
  }catch(e){
emit(state.copyWith(productStatus: ProductStatus.failure, msg: e.toString()));
  }
  }
  Future<void> _onAddProductsEvent(AddProductEvent event, Emitter<ProductState> emit) async {
  
final oldList= List<Product>.from(state.products);

  emit(state.copyWith(
    products: [...oldList, event.product],
    productStatus: ProductStatus.success,
  ));
  try{
    await repo.addProduct(event.product);

  }
catch(e){
    emit(state.copyWith(
      products: oldList,
      productStatus: ProductStatus.failure,
      msg: e.toString(),
    ));
  }
}
 


   Future<void> _onDeleteProductsEvent(DeleteProductEvent event, Emitter<ProductState> emit) async {
  
final oldList= List<Product>.from(state.products);

final newList = oldList.where((element) => element.id != event.id).toList();
  
  emit(state.copyWith(
    products: newList,
    productStatus: ProductStatus.success,
  ));
  try{
    await repo.deleteProduct(event.id);
  }catch(e){
    emit(state.copyWith(
      products: oldList,
      productStatus: ProductStatus.failure,
      msg: e.toString(),
    ));

  }
  }
   Future<void> _onToggleProductsEvent(ToggleProductEvent event, Emitter<ProductState> emit) async {
  final oldList= List<Product>.from(state.products);
  final newList = oldList.map((e) {
    if(e.id == event.id){
      return e.copyWith(isCompleted: event.value);
    }
    return e;
  }).toList();
  emit(state.copyWith(
    products: newList,
    productStatus: ProductStatus.success,
  ));
  try{
    await repo.toggleProduct(event.id, event.value);
  }catch(e){
    emit(state.copyWith(
      products: oldList,
      productStatus: ProductStatus.failure,
      msg: e.toString(),
    ));
  }
  
}

}