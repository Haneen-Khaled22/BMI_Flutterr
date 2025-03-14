part of 'product_cubit.dart';

@immutable
sealed class ProductState {}


final class ProductInitial extends ProductState {}

final class ProductLoadingState extends ProductState {

}
final class ProductSuccessState extends ProductState {
  ProductsModel? productsModel;
  ProductSuccessState(this.productsModel);
}
final class ProductErrorState extends ProductState {

  final String errormsg;
  ProductErrorState(this.errormsg);
}
