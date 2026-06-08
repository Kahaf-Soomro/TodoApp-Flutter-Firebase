

import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final String title;
  final String description;
  final bool isCompleted;

  const Product({required this.id, required this.title, required this.description, required this.isCompleted});
 
 
 
  @override
  // TODO: implement props
  List<Object?> get props =>[
    id,
    title,
    description,
    isCompleted
  ] ;

  

  Product copyWith({
    String? id,
    String? title,
    String? description,
    bool? isCompleted,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'isCompleted': isCompleted,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      isCompleted: map['isCompleted'] as bool,
    );
  }
}
