// ignore_for_file: prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';

class MyAlertBox extends StatefulWidget {
   MyAlertBox(
    {super.key , 
    required this.amountController , 
    required this.descriptionController , 
    required this.selectedCategory , 
    required this.onSave,
    required this.setCategory
    }
   );
  final TextEditingController descriptionController;
  final TextEditingController amountController;
  String? selectedCategory;
  final void Function()? onSave;
  final Function(String) setCategory;


  
  @override
  State<MyAlertBox> createState() => _MyAlertBoxState();
}

class _MyAlertBoxState extends State<MyAlertBox> {
 final _formKey = GlobalKey<FormState>();

  final List<String> _categories = ['Food', 'Transport', 'Shopping', 'Other'];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Enter Details'),
      content:Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: widget.descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8) , 
                  borderSide: BorderSide(color: Colors.green ),),
                labelStyle: TextStyle(fontWeight: FontWeight.w600)   
                ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a description';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: 'Category',labelStyle: TextStyle(fontWeight: FontWeight.w600) ),
              value: widget.selectedCategory,
              items: _categories.map((category) {
                return DropdownMenuItem(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (value) {
                widget.setCategory(value!);
                setState(() {
                  widget.selectedCategory = value;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select a category';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: widget.amountController,
              decoration: InputDecoration(labelText: 'Amount',labelStyle: TextStyle(fontWeight: FontWeight.w600) ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an amount';
                }
                final number = double.tryParse(value);
                if (number == null) {
                  return 'Please enter a valid number';
                }
                return null;
              },
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel' , style : TextStyle(color: Color.fromARGB(255, 26, 67, 28))),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              widget.onSave!();          
              Navigator.of(context).pop();
            }
          },
          child: Text('Submit' , style: TextStyle(color : const Color.fromARGB(255, 105, 240, 110))),
        ),
      ],
    );
  }
}