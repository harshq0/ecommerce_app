import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final String text;
  final IconData icons;
  final void Function()? onTap;
  const MyListTile(
      {super.key,
      required this.text,
      required this.icons,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 11),
      child: ListTile(
        leading: Icon(
          icons,
          color: Colors.white,
        ),
        title: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        onTap: onTap,
      ),
    );
  }
}
