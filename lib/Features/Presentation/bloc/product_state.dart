// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_bloc.dart';
enum ProductStatus { initial, loading, success, failure }
class ProductState extends Equatable {
  final ProductStatus status;
  final List<Product> products;
  final String? msg;
  
  const ProductState({
    this.status = ProductStatus.initial,
    this.products = const [],
    this.msg,
  });

  @override
  List<Object> get props => [status, products, msg ?? ''];

  ProductState copyWith({
    ProductStatus? productStatus,
    List<Product>? products,
    String? msg,
  }) {
    return ProductState(
      status: productStatus ?? this.status,
      products: products ?? this.products,
      msg: msg ?? this.msg,
    );
  }


}

final class ProductInitial extends ProductState {}
