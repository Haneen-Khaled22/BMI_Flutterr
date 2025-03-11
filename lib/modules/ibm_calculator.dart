

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:testandroid/modules/result_screen.dart';

class IBMCalculatorScreen extends StatefulWidget {
  const IBMCalculatorScreen({super.key});

  @override
  State<IBMCalculatorScreen> createState() => _IBMCalculatorScreenState();
}

class _IBMCalculatorScreenState extends State<IBMCalculatorScreen> {

  double height =170;
  bool isMale =true;
  int weight = 60;
  int age =20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF16162C),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF16162C),
        title: Text('IBM Calculator',style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  spacing: 20,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: GestureDetector(
                         onTap:(){
                           setState(() {
                             isMale = true;
                           });
                         },
                        child: Container(
                          decoration: BoxDecoration(
                            color: isMale?Colors.blueGrey: Color(0xFF1D1D2E),
                            borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/maale.png',width: 120,height: 120,color: Colors.white,),
                            Text('Male',style: TextStyle(fontSize: 30,color: Colors.grey),)
                          ],

                                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){

                          setState(() {
                            isMale =false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color:isMale?Color(0xFF1D1D2E): Colors.blueGrey,
                              borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/ffemale.png',width: 120,height: 120,color: Colors.white,),
                              Text('Female',style: TextStyle(fontSize: 30,color: Colors.grey),)
                            ],

                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF1D1D2E),
                  borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                width: double.infinity,


                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Height',style: TextStyle(
                      color: Colors.grey,

                      fontSize: 30,

                    ),),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${height.round()}',style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30
                        ),),
                        Text('CM',style: TextStyle(
                            color: Colors.grey,

                            fontSize: 20
                        ),),
                      ],
                    ),
                    Slider(
                        value: height,
                        min: 80,
                        max: 220,
                        activeColor: Colors.white,
                        onChanged: (  value){
                      setState(() {
                        height = value;
                        print(value);
                      });

                    })
                  ],
                ),
              ),
            ),
          ),

          Expanded(
            child: Container(
              width: double.infinity,
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  spacing: 20,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xFF1D1D2E),
                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Text('Weight',style: TextStyle(fontSize: 30, color: Colors.grey),),
                            Text('$weight',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.white),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  backgroundColor: Colors.grey,
                                  onPressed: (){
                                  setState(() {
                                    weight++;
                                  });
                                },
                                child: Icon(Icons.add,color: Colors.white,size: 30,),mini: true,heroTag: 'add',),
                                FloatingActionButton(
                                  backgroundColor: Colors.grey,
                                  onPressed: (){
                                  setState(() {
                                    weight--;
                                  });
                                },
                                  child: Icon(Icons.remove,color: Colors.white,size: 30,),mini: true,heroTag: 'remove',)
                              ],
                            )
                          ],

                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xFF1D1D2E),
                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Text('Age',style: TextStyle(fontSize: 30,color: Colors.grey),),
                            Text('$age',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.white),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  backgroundColor: Colors.grey,
                                  onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                                  child: Icon(Icons.add,color: Colors.white,size: 30,),mini: true,heroTag: 'add',),
                                FloatingActionButton(
                                  backgroundColor: Colors.grey,
                                  onPressed: (){
                                  setState(() {
                                    age--;
                                  });
                                },
                                  child: Icon(Icons.remove,color:Colors.white,size: 30,),mini: true,heroTag: 'remove',)
                              ],
                            )
                          ],

                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Container(
            color: Color(0xFFA11245),
            width: double.infinity,
            height: 60,
            child: MaterialButton(onPressed: (){

              double result = weight / pow(height/100, 2);
              print(result.round());
              Navigator.push(context, MaterialPageRoute(builder:(context)=> ResultScreen(
                  result: result,
                  age: age,
                  isMale: isMale)));
            },
            child: Text('CALCULATE',style: TextStyle(fontSize: 20,
            color: Colors.white),),),
          )
        ],
      ),
    );
  }
}
