// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => RaisedButton(
        onPressed: onClicked,
        color: Theme.of(context).primaryColor,
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.white, fontSize: 18, fontFamily: 'Rubik'),
        ),
      );
}

// class name extends StatefulWidget {
//   ButtonWidget({
//     Key? key,
//     }) : super(key: key);

//   @override
//   State<name> createState() => _nameState();
// }

// class _nameState extends State<name> {
//   @override
//   Widget build(BuildContext context) =>
// }
