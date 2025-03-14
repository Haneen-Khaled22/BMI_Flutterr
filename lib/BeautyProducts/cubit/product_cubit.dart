import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:testandroid/BeautyProducts/api_provider.dart';
import 'package:testandroid/BeautyProducts/products_model.dart';

part 'product_state.dart';
ProductsModel? productsModel;

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial()){
    getProduct();
  }



  getProduct()async
  {
    try{
      emit(ProductLoadingState());
      productsModel = await ApiProvider().getProducts();
      emit(ProductSuccessState(productsModel));

    }catch(error){
      print(error.toString());
      emit(ProductErrorState(error.toString()));
    }

  }


}
