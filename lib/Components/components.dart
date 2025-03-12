import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testandroid/BeautyProducts/products_model.dart';

import '../layout/NewaApp/cubit.dart';
import '../layout/NewaApp/states.dart';

Widget buildItemData(article,context)=>Padding(
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
                child: Text('${article['title']}',style: Theme.of(context).textTheme.titleLarge,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,),
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

Widget buildProduct({Product? product})=>Padding(
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


