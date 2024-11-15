import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
var hcoll=TextEditingController();
var icoll=TextEditingController();
var wcoll=TextEditingController();
var result =" ";
var bgcolor=Colors.deepPurple;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('BMI'),
      ),
      body:Container(
        color: bgcolor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('BMI',style: TextStyle(fontSize: 21,fontWeight: FontWeight.w600)
                ,),
                TextField(
                  controller: wcoll,
                  decoration: InputDecoration(label: Text('Enter the weight'),
                    prefixIcon: Icon(Icons.line_weight)
                  ),
                  keyboardType: TextInputType.number  ,
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: hcoll,
                  decoration: InputDecoration(label: Text('Enter the hight'),
                      prefixIcon: Icon(Icons.high_quality_sharp)
                  ),
                  keyboardType: TextInputType.number  ,
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: icoll,
                  decoration: InputDecoration(label: Text('Enter the hight(inc)'),
                      prefixIcon: Icon(Icons.line_weight)
                  ),
                  keyboardType: TextInputType.number  ,
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(onPressed: (){
                  var ht=hcoll.text.toString();
                  var wt=wcoll.text.toString();
                  var it=icoll.text.toString();
                  if(ht!="" && wt!=""&& it!=""){
                    var iwt=int.parse(wt);
                    var iht=int.parse(ht);
                    var iit=int.parse(it);
                    var tInc= (iht*12)+iit;
                    var tCm=tInc*2.54;
                    var tm=tCm/100;
                    var bmi=iwt/(tm*tm);
                    var msg="";
                    if(bmi>25){
                      msg="your are overwight";
                      bgcolor=Colors.red;

                    }else if(bmi<18){
                      msg="your are unterwight";
                      bgcolor=Colors.cyan;

                    }else{
                      msg="you are good to go";
                      bgcolor=Colors.green;

                    }

                    setState(() {
                      result=' $msg \n BMI is $bmi';
                    });

                  }else{
                    setState(() {

                      result="please fill all the line";
                    });
                  }

                }, child: Text('calculate')),
                Text(result,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 21),)


              ],
            ),
          ),
        ),
      )
    );
  }
}
