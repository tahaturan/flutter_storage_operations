import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SayfaGecisBtn extends StatelessWidget {
  final String butonName;
  Widget page;
  SayfaGecisBtn({required this.butonName, required this.page, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => page,
          ),
        );
      },
      child: Text(
        butonName,
      ),
    );
  }
}
