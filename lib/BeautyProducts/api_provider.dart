
import 'package:dio/dio.dart';
import 'package:testandroid/BeautyProducts/products_model.dart';

class ApiProvider{

  final String baseUrl="https://dummyjson.com";

  ProductsModel? productsModel;

  Future<ProductsModel?> getProducts()async

  {
    try
    {
      Response response = await Dio().get("$baseUrl/products");
      print(response.data.toString());

      productsModel = ProductsModel.fromJson(response.data);
      print(productsModel?.products[1].title);
      return productsModel;

    }catch(error){
      print(error.toString());
    }

  }
}

