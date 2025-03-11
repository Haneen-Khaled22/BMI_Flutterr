import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {


  bool isMale =true;
  var age = 20;
  double result = 60;

  ResultScreen({
    required this.result,
    required this.age,
    required this.isMale
});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back,color: Colors.white,size: 30,)),
        backgroundColor: Color(0xFF16162C),
        title: Text('Result',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text('Gender : ${isMale?"Male":"Female"}',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,),),
            Text('Age : $age',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,),),
            Text('Result : ${result.round()}',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,),),

          ],
        ),
      ),
    );
  }
}
