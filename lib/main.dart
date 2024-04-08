import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const myApp());
}

class myApp extends StatelessWidget{
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My app",
      theme: ThemeData(
        primaryColor: Colors.purple,
      ),
      home: DashBoardScreen(),
    );
  }
}

class DashBoardScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return DashBoardState();
  }
}

class DashBoardState extends State<DashBoardScreen>{
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var res = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI DashBoard"),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Container(
          width: 500,
          color: Colors.purple.shade100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("BMI",style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: wtController,
                  decoration: InputDecoration(
                    hintText: "Enter your Weight in (kgs)",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                    ),
                    prefixIcon: Icon(Icons.monitor_weight),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: ftController,
                  decoration: InputDecoration(
                    hintText: "Enter your Height in (feet)",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                    ),
                    prefixIcon: Icon(Icons.height),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: inController,
                  decoration: InputDecoration(
                    hintText: "Enter your Height in (inches)",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                    ),
                    prefixIcon: Icon(Icons.height),
                  ),
                ),
              ),
              ElevatedButton(onPressed: (){
                var wt = wtController.text.toString();
                var ft = ftController.text.toString();
                var inc = inController.text.toString();

                if(wt != "" && ft != "" && inc != ""){
                  //BMI Calculation
                  int w = int.parse(wt);
                  int f = int.parse(ft);
                  int i = int.parse(inc);
                   var tinch = (f*12)+i;
                   var tcm = tinch*2.54;
                   var tm = tcm/100;

                   var bmi = w/(tm*tm);
                   res = 'Your BMI is: ${bmi.toStringAsFixed(3)}';
                   setState(() {
                   });
                }else{
                  res = "Please fill all the required blanks";
                  setState(() {

                  });
                }

              }, child: Text("Calculate",style: TextStyle(fontWeight: FontWeight.bold),)
              ),
              Text(res,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23),),
            ],
          ),
        ),
      )
    );
  }
  
}