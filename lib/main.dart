import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Fraction Calculator'),
    );
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controller_numerator_1=new TextEditingController();
  TextEditingController controller_numerator_2=new TextEditingController();
  TextEditingController controller_numerator_3=new TextEditingController();
  TextEditingController controller_denominator_1=new TextEditingController();
  TextEditingController controller_denominator_2=new TextEditingController();
  TextEditingController controller_denominator_3=new TextEditingController();
  String dropdownValue_add='Add';
  int result_numerator=0;
  int result_denominator=0;
  int fake=1;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        resizeToAvoidBottomInset:false,

      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
            ),
            Container(
              width: 500,
              height: 150,
              child:Image.asset(
                "assets/images/mycalculator.jpg",
                scale: 5,
                fit: BoxFit.fill,
              ),
            ),

            Expanded(
              child:Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                  ),
                  Expanded(
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child:TextField(
                            controller: controller_numerator_1,
                            keyboardType: TextInputType.numberWithOptions(),
                            decoration: InputDecoration(
                              border: new OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(10.0),
                                ),
                              ),
                              hintText: 'Numerator',
                            ),
                          ),
                        ),
                        Container(
                          child:TextField(
                            controller: controller_denominator_1,
                            keyboardType: TextInputType.numberWithOptions(),
                            decoration: InputDecoration(
                              isDense: true,
                              border: new OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(10.0),
                                ),
                              ),
                              hintText: 'Denominator',
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),

                  DropdownButton<String>(
                    value: dropdownValue_add,
                    iconSize: 30,
                    onChanged: (String newValue){
                      setState(() {
                        dropdownValue_add=newValue;
                        if(newValue=='Add'){
                          fake=1;
                        }if(newValue=='Substract'){
                          fake=2;
                        }if(newValue=='Multiply'){
                          fake=3;
                        }if(newValue=='Divide'){
                          fake=4;
                        }
                      });
                    },
                    items: <String>['Add','Substract','Multiply','Divide']
                        .map<DropdownMenuItem<String>>((String value){
                      return DropdownMenuItem<String>(
                        value:value,
                        child:Text(value,),
                      );
                    })
                        .toList(),
                  ),

                  Expanded(
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child:TextField(
                            style: TextStyle(
                              color: const Color(0xFF000000),
                            ),
                            controller: controller_numerator_2,
                            keyboardType: TextInputType.numberWithOptions(),
                            decoration: InputDecoration(

                              border: new OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(10.0),
                                ),
                              ),
                              hintText: 'Numerator',
                            ),
                          ),
                        ),
                        Container(
                          child:TextField(
                            controller: controller_denominator_2,
                            keyboardType: TextInputType.numberWithOptions(),
                            decoration: InputDecoration(
                              isDense: true,
                              border: new OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(10.0),
                                ),
                              ),
                              hintText: 'Denominator',
                            ),
                          ),
                        ),
                      ],
                    ),

                  ),
                  new Text(' = '),
                  Expanded(
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child:TextField(
                            controller: controller_numerator_3,
                            keyboardType: TextInputType.numberWithOptions(),
                            decoration: InputDecoration(
                              isDense: true,
                              border: new OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child:TextField(
                            controller: controller_denominator_3,
                            keyboardType: TextInputType.numberWithOptions(),
                            decoration: InputDecoration(
                              border: new OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),

            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 150),
                ),
                OutlineButton(
                  child: Text('Run it'),
                  onPressed: (){
                    if(fake==1){
                      _addOperation();
                    }if(fake==2){
                      _substractOperation();
                    }if(fake==3){
                      _multiplyOperation();
                    }if(fake==4){
                      _divideOperation();
                    }
                    controller_numerator_3.text=result_numerator.toString();
                    controller_denominator_3.text=result_denominator.toString();
                  },
                ),
                OutlineButton(
                  padding: EdgeInsets.all(10),
                  child: Text('Clear'),
                  onPressed: (){
                    controller_numerator_1.text="";
                    controller_denominator_1.text="";
                    controller_numerator_2.text="";
                    controller_denominator_2.text="";
                    controller_numerator_3.text="";
                    controller_denominator_3.text="";
                  },
                ),

              ],
            ),
          ],

        ),
      ),
    );
  }
  void _addOperation() {
    setState(() {
      int a=int.parse(controller_numerator_1.text);
      int b=int.parse(controller_denominator_1.text);
      int c=int.parse(controller_numerator_2.text);
      int d=int.parse(controller_denominator_2.text);
      result_numerator=a*d+b*c;
      result_denominator=b*d;

    });
  }
  void _substractOperation() {
    setState(() {
      int a=int.parse(controller_numerator_1.text);
      int b=int.parse(controller_denominator_1.text);
      int c=int.parse(controller_numerator_2.text);
      int d=int.parse(controller_denominator_2.text);
      result_numerator=a*d-b*c;
      result_denominator=b*d;
    });
  }
  void _multiplyOperation() {
    setState(() {
      int a=int.parse(controller_numerator_1.text);
      int b=int.parse(controller_denominator_1.text);
      int c=int.parse(controller_numerator_2.text);
      int d=int.parse(controller_denominator_2.text);
      result_numerator=a*c;
      result_denominator=b*d;
    });
  }
  void _divideOperation() {
    setState(() {
      int a=int.parse(controller_numerator_1.text);
      int b=int.parse(controller_denominator_1.text);
      int c=int.parse(controller_numerator_2.text);
      int d=int.parse(controller_denominator_2.text);
      result_numerator=a*d;
      result_denominator=b*c;
    });
  }
}
