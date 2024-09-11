import 'package:flutter/material.dart';

Widget bottom({
  required String? name,
  VoidCallback? ontap,
  Color? color,
  @required double? widt,
  @required double? high,
  @required double bordRadius = 20,
  @required Color? textcolor,
  @required double? fontsize,
}) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
        width: widt,
        height: high,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(bordRadius),
        ),
        child: Center(
          child: Text(
            name!,
            style: TextStyle(color: textcolor, fontSize: fontsize),
          ),
        )),
  );
}
