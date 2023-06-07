import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({this.hintText, this.onchange, this.inputType, this.text,required this.labelText});

  String? hintText;
  Function(String)? onchange;
  TextInputType? inputType;
  // TextEditingController? controller ;
  String? text;
  String? labelText ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextField(
        keyboardType: inputType,
        controller: TextEditingController(text: text),
        style: TextStyle(color: Colors.black),
        onChanged: onchange,
        decoration: InputDecoration(
            hintText: hintText,
            label: Text(labelText!),

            hintStyle: const TextStyle(color: Colors.black),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.black),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            )),
      ),
    );
  }
}
