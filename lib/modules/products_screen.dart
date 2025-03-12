import 'package:flutter/material.dart';
import 'package:testandroid/BeautyProducts/api_provider.dart';
import 'package:testandroid/BeautyProducts/products_model.dart';

import '../Components/components.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});


  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {

  ProductsModel? productsModel;
  bool isLoading = true;

   getProductsFromApiProvider()async
  {
    productsModel = await ApiProvider().getProducts();
    print("${productsModel?.products[1].title}");
    setState(() {
      isLoading = false;
    });

  }
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    getProductsFromApiProvider();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(' Products',style: TextStyle(
          color: Colors.white
        ),),
      ),
      body:isLoading?
          Center(child: CircularProgressIndicator()):
      GridView.builder(
        itemBuilder: (context,index)=>buildProduct(
          product :productsModel?.products[index]
        ),
        itemCount: productsModel?.products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.6,
       ),),



    );
  }
}
