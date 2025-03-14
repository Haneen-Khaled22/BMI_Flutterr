import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testandroid/BeautyProducts/products_model.dart';
import 'package:testandroid/layout/NewaApp/webview/webview_screen.dart';

import '../layout/NewaApp/cubit.dart';
import '../layout/NewaApp/states.dart';

Widget buildItemData(article,context)=>InkWell(
  onTap: (){
    navigateTo(context, WebviewScreen(article['url']));
  },
  child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
  
      children: [
        Container(
          width: 150,
          height: 130,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage('${article['urlToImage']}')
              )
          ),
        ),
        SizedBox(width: 20,),
        Expanded(
          child: Container(
            height: 130,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Builder(
                    builder: (context) {
                      return Text('${article['title']}',style: Theme.of(context).textTheme.titleLarge,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,);
                    }
                  ),
                ),
                Text('${article['publishedAt']}',style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20
                ),)
              ],
            ),
          ),
        )
      ],
    ),
  ),
);

Widget divider()=> Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20.0),
  child: Container(
    width: double.infinity,
    height: 2,
    color: Colors.grey[200],
  ),
);
//
Product? product;

Widget buildProduct({Product? product ,})=>Padding(
  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
  child: Container(
    height: 250,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black12,width: 2,
        )
    ),

    child: Padding(
      padding: const EdgeInsets.all(9.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Container(
          height: 150,
            decoration: BoxDecoration(

                image: DecorationImage(

                    fit: BoxFit.cover,
                    image: NetworkImage('${product?.thumbnail}'))
            ),
          ),
          SizedBox(height: 20),
          Text('${product?.title}' , style: TextStyle(
              fontWeight: FontWeight.bold,fontSize: 20
          ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,),
          Expanded(
            child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('price : ${product?.price}' , style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[600]
                ),),
                Text('rating : ${product?.rating}' , style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[600]
                ),),

              ],
            ),
          )
        ],
      ),
    ),
  ),
);

void navigateTo(context,widget)=>Navigator.push(context, MaterialPageRoute(builder:(context)=> widget));

Widget defaultTextFormFeild(
{
  @required TextEditingController? controller,
  required TextInputType type,
  required String? Function(String?)? validator, // Corrected type
  void Function(String)? onSubmit, // Corrected type
  void Function(String)? onChange,
  String? labelText,
  String? hinttext,
  IconData? prefixicon,
  IconData? suffixicon,

}
    )=>TextFormField(
  validator: validator,
  controller: controller,
  onFieldSubmitted: onSubmit,
  onChanged: onChange,
  keyboardType: type,
  decoration: InputDecoration(
    border: OutlineInputBorder(),
    labelText: labelText,
    hintText: hinttext,
    prefixIcon: Icon(prefixicon),
    suffixIcon: Icon(suffixicon),


  ),
);

Widget defaultmaterialButton(
{
   @required double width = double.infinity,
   required void Function() onPressed,
    required String text,
  required Color color,
}
    )=>Container
  (
  width: width,
  padding: EdgeInsets.all(6),
  decoration: BoxDecoration(
    color:color,
    borderRadius: BorderRadius.circular(8),
  ),
  child: MaterialButton(
    onPressed: onPressed,
    child: Text(
      text,
      style: TextStyle(color: Colors.white, fontSize: 18),
    ),
  ),
);
