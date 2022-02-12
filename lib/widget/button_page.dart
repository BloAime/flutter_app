import 'dart:ui';
import 'package:application_exo/Pages/register_page.dart';
import 'package:application_exo/Test/tresd.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Test/connect_page.dart';


class buttonWidget extends StatefulWidget {
  //final int num;
  final double num2;
  final String child;
  final Function saint;
  final Color;
  const buttonWidget({
    Key? key,
    required this.Color,
    required this.num2,
    required this.child,
    required this.saint,
  }) : super(key: key);
  @override
  State<buttonWidget> createState() => _buttonWidgetState();
}

class _buttonWidgetState extends State<buttonWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            width: widget.num2,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: widget.Color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              onPressed: () {
                widget.saint();
              },
              child: Text(widget.child,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,),),
            ),
          ),
        ],
      ),
    );
  }
}
