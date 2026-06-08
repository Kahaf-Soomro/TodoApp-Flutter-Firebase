part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}


class LoadProductsEvent extends ProductEvent {




}
class AddProductEvent extends ProductEvent {
  final Product product;

  const AddProductEvent(this.product);

  @override
  List<Object> get props => [product];
}

class DeleteProductEvent extends ProductEvent {
  final String id;

  const DeleteProductEvent(this.id);

  @override
  List<Object> get props => [id];
}
class ToggleProductEvent extends ProductEvent {
  final String id;
  final bool value;

  const ToggleProductEvent(this.id, this.value);

  @override
  List<Object> get props => [id, value];
}