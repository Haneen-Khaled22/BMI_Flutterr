import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testandroid/BeautyProducts/api_provider.dart';
import 'package:testandroid/BeautyProducts/cubit/product_cubit.dart';
import 'package:testandroid/BeautyProducts/products_model.dart';

import '../Components/components.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});


  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {


  // bool isLoading = true;
  //
  //  getProductsFromApiProvider()async
  // {
  //   productsModel = await ApiProvider().getProducts();
  //   print("${productsModel?.products[1].title}");
  //   setState(() {
  //     isLoading = false;
  //   });
  //
  // }
  ProductsModel? productsModel;
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    // getProductsFromApiProvider();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>ProductCubit(),
      child: BlocConsumer<ProductCubit,ProductState>(
        listener: (BuildContext context, state) {
          if(state is ProductErrorState){
            SnackBar snackBar = SnackBar(content: Text(state.errormsg));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);

          }
          if(state is ProductSuccessState){
            productsModel = state.productsModel;
          }
        },
        builder: (BuildContext context, Object? state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blueGrey,
              title: Text(' Products',style: TextStyle(
                  color: Colors.white
              ),),
            ),
            body: state is ProductLoadingState?
            Center(child: CircularProgressIndicator()):
            state is ProductErrorState? SizedBox():
            GridView.builder(
              itemBuilder: (context,index)=>buildProduct(
                  product :productsModel?.products[index]
              ),
              itemCount:productsModel?.products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
              ),),



          );
        },

      ),
    );
  }
}
