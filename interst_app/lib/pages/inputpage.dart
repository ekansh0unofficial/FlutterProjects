// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';



class InputPage extends StatefulWidget {
  // const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

   int principle  = 0;
   int rate = 0 ;
  final _formKey = GlobalKey<FormState>();  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black87,),  
      body: SingleChildScrollView(
              child:Container(
                color: Colors.black,
                child: Form(
                  key : _formKey,
                  child: Column( 
                      crossAxisAlignment: CrossAxisAlignment.center,                  
                      children: [
                        Padding( 
                          padding: EdgeInsets.fromLTRB(32 ,32,32,16)  ,
                          child:Image.asset("lib/assets/images/bwink_ppl_06_single_09.jpg" ,)
                        ),
                          
                        TextFormField(
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.white,
                          style: TextStyle(color: Colors.white),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a value';
                            }
                            if (int.tryParse(value) == null) {
                              return 'Please enter a valid integer';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "Principle Amount",
                            filled: true , 
                            fillColor :Colors.black12,
                            focusColor: Colors.white,
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.white)),
                            border: OutlineInputBorder(),
                            floatingLabelStyle: TextStyle(color: Colors.white)
                          ), 
                          onChanged: (value){setState(() {
                            principle = int.parse(value);
                            print(principle);
                          }); },
                        ),
                        SizedBox(height: 24,),
                        
                        TextFormField(
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.white,
                          style: TextStyle(color: Colors.white),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a value';
                            }
                            if (int.tryParse(value) == null) {
                              return 'Please enter a valid integer';
                            }
                            return null;
                          },
                          
                          decoration: InputDecoration(
                            labelText: "Interst Rate",
                            filled: true , 
                            fillColor :Colors.black12,
                            focusColor: Colors.white,
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.white)),
                            border: OutlineInputBorder(),
                            floatingLabelStyle: TextStyle(color: Colors.white),
                            suffixText: "%"
                          ), 
                          onChanged: (value){setState(() {
                            rate = int.parse(value);
                            print(rate);
                            print(principle);
                          });},
                        ),
                          
                        SizedBox(height : 22),

                        DateInputPage(),
                      
                      ],
                  ),
                ),
              ),),

    );

  }


  final TextEditingController _fromDateController = TextEditingController();
  final TextEditingController _toDateController = TextEditingController();
  DateTime _fromDate = DateTime.now() ;
  DateTime _toDate = DateTime.now() ;
  double solution = 0;
  
  @override
  void dispose() {
    _fromDateController.dispose();
    _toDateController.dispose();
    super.dispose();
  }

 

  Future<void> _selectDate(BuildContext context, TextEditingController controller, bool isFromDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != DateTime.now())
      setState(() {
        controller.text = "${picked.toLocal()}".split(' ')[0];
        if (isFromDate) {
          _fromDate = picked;
        } else {
          _toDate = picked;
        }
      });
  }

  Widget DateInputPage() {
    return   SingleChildScrollView(
      child: Center(
              child: Padding(
                padding:  EdgeInsets.fromLTRB(32.0 , 0 , 32 ,32 ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 250,
                      child: TextFormField(
                        controller: _fromDateController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: "From Date",
                          filled: true , 
                          fillColor :Colors.black12,
                          focusColor: Colors.white,
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.white)),
                          border: OutlineInputBorder(),
                          floatingLabelStyle: TextStyle(color: Colors.white),
                          icon: Icon( Icons.calendar_today)
                        ),
                        readOnly: true,
                        onTap: () => _selectDate(context, _fromDateController, true),
                      ),
                    ),
                    SizedBox(height: 20 ),
                    Container(
                      width: 250,
                      child: TextFormField(
                        controller: _toDateController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: "To Date",
                          filled: true , 
                          fillColor :Colors.black12,
                          focusColor: Colors.white,
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.white)),
                          border: OutlineInputBorder(),
                          floatingLabelStyle: TextStyle(color: Colors.white),
                          icon : Icon(Icons.calendar_today)
                        ),
                        readOnly: true,
                        onTap: () => _selectDate(context, _toDateController, false),
                      ),
                    ),
                    SizedBox(height: 50,),

                    ElevatedButton(
                      onPressed: (){                       
                         setState(() {
                           solution = totalAmount(daysBetweenDates(_fromDate, _toDate),principle , rate);
                           print(daysBetweenDates(_fromDate, _toDate));
                           print(solution);
                         });
                      }, 
                      child: Text("Calculate")
                    ),

                    Row(children: [
                      Text("Total Amount : ",style: TextStyle(fontSize: 12 , color : Colors.white70), ),
                      Text("$solution" , style: TextStyle(fontSize: 12 , color : Colors.white),)
                    ],)
                  ],
                ),
              ),   
        ),
    );
  }

  int daysBetweenDates(DateTime startDate, DateTime endDate) {
  Duration difference = endDate.difference(startDate);
  return difference.inDays;
}

double totalAmount(int days , int principle , int rate){
  double x = ( principle * days * rate) /100;
  x = principle + x ; 
  return x;
}
}