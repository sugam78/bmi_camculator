import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: weight,
              decoration: InputDecoration(
                hintText: 'Enter Your Weight in Kg',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 1),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: height,
              decoration: InputDecoration(
                hintText: 'Enter Your height in meter',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 1),
                ),
              ),
            ),
            SizedBox(height: 30,),
            InkWell(
              onTap: (){
                double hei = double.parse(height.text.toString());
                double wei = double.parse(weight.text.toString());
                calculateBmi(context, hei, wei);
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Center(
                  child: Text('Calculate'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  calculateBmi(BuildContext context,double hei,double wei){
    double bmi;
    String health = '';
    bmi = wei/hei/hei;
    if(bmi<18.5){
      health = 'UnderWeight';
    }
    else if(bmi>18.5&&bmi<=24.9){
      health = 'Normal';
    }
    else if(bmi>25&&bmi<=29.9){
      health = 'Overweight';
    }
    else if(bmi>30&&bmi<=34.9){
      health = 'Obesity(Class i)';
    }
    else if(bmi>35&&bmi<=39.9){
      health = 'Obesity(Class ii)';
    }
    else if(bmi>40){
      health = 'Obesity(Class iii)';
    }
    showDialog(context: context, builder: (context){
      return AlertDialog(
        content: Text('Your BMI is $bmi and You are in class $health'),
        actions: [
          TextButton(onPressed: (){
            Navigator.of(context).pop();
          },
    child: Text('Ok')
    ),
        ],
      );
    });
  }
}
