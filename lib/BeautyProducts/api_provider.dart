
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testandroid/BeautyProducts/products_model.dart';

class ApiProvider{

  final String baseUrl="https://dummyjson.com";

  ProductsModel? productsModel;

  Future<ProductsModel?> getProducts()async

  {
    try
    {
      Response response = await Dio().get("$baseUrl/products",);
      print(response.data.toString());

      productsModel = ProductsModel.fromJson(response.data);
      print(productsModel?.products[1].title);
      return productsModel;

    }catch(error){
      print(error.toString());
      if(error is DioException){

        print(error.response?.data["message"]);
        throw Exception(error.response?.data);
      }
    }

  }




  userLoginEmail({required String email, required String password}) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    try {
      FormData userData = FormData.fromMap({
        "username": email,
        "password": password,
      });
      Response response = await Dio().post(
        "$baseUrl/auth/login",
        data: userData,
      );
      print(response.data["accessToken"]);
      sharedPreferences.setString("token", response.data['accessToken']);
    } catch (e) {
      print(e.toString());
      // if(e is DioException){
      //   print(e.response?.data["message"]);
      //   throw Exception(e.response?.data["message"]);
      // };
    }
  }

}

