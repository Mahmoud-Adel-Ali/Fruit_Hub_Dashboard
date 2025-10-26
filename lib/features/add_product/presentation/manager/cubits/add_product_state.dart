part of 'add_product_cubit.dart';

class AddProductState {}

class AddProductInitial extends AddProductState {}

class AddProductLoading extends AddProductState {}

class AddProductFailure extends AddProductState {
  final String message;
  AddProductFailure({required this.message});
}

class AddProductSuccess extends AddProductState {}
