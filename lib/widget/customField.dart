import 'package:flutter/material.dart';

Widget customTextField(
    {required String hinName,
    Color fillColor = Colors.white,
    @required Icon? preIcon,
    double bordRadius = 20,
    @required Function(String)? onCh,
    @required TextInputType? textType,
    required String? Function(String?)? valid}) {
  return TextFormField(
    onChanged: onCh,
    validator: valid,
    keyboardType: textType,
    decoration: InputDecoration(
        filled: true,
        hintText: hinName,
        prefixIcon: preIcon,
        fillColor: fillColor,
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(bordRadius))),
  );
}
