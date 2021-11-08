import 'package:flutter/material.dart';

class CustomeButton extends StatefulWidget {
  final String btn;

  const CustomeButton({ key, required this.btn}) : super(key: key);
  @override
  _CustomeButtonState createState() => _CustomeButtonState();
}

class _CustomeButtonState extends State<CustomeButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width / 1.2,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor,
            Color(0xfff78361),
          ],
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text(
          widget.btn,
          style: Theme.of(context).textTheme.caption!.copyWith(
              letterSpacing: 0.6,
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
    );
  }
}
