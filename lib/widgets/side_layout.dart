import 'package:flutter/material.dart';

class SideLayout extends StatelessWidget {
  const SideLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: const Color(0xff404040),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 70),
            Image.asset('assets/images/logo.png'),
            const Text(
              'Jeff Li Studio',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
