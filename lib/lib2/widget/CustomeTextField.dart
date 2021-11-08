import 'package:flutter/material.dart';

class CustomeTextField extends StatefulWidget {
  final String txt;

  const CustomeTextField({  key, required this.txt}) : super(key: key);
  @override
  _CustomeTextFieldState createState() => _CustomeTextFieldState();
}

class _CustomeTextFieldState extends State<CustomeTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width / 1.2,
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(30)),
      child: Center(
        child: TextField(
          style: Theme.of(context).textTheme.caption!.copyWith(
                letterSpacing: 0.6,
                fontSize: 15,
                color: Colors.white.withOpacity(0.8),
              ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(left: 20),
            hintText: widget.txt,
            hintStyle: Theme.of(context).textTheme.caption!.copyWith(
                  letterSpacing: 0.6,
                  fontSize: 15,
                  color: Colors.white.withOpacity(0.8),
                ),
          ),
        ),
      ),
    );
  }
}
