import 'package:flutter/material.dart';

class ModelButton extends StatelessWidget {
  final String text;
  final VoidCallback onClick;
  final Color? color;
  final Icon? icon;

  const ModelButton(
      {super.key,
      required this.text,
      required this.onClick,
      this.color,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 30,
      child: ElevatedButton(
          onPressed: onClick,
          style:
              ElevatedButton.styleFrom(backgroundColor: color ?? Colors.white),
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.water_drop,color: Colors.white,),
              SizedBox(
                width: 10,
              ),
              Text(
                '+${text} ml',
                style: TextStyle(color: Colors.white),
              )
            ],
          )),
    );
  }
}
