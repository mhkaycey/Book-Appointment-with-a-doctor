import 'package:doctor_app/views/widgets/top_bar.dart';
import 'package:flutter/material.dart';

class NotifiedPage extends StatelessWidget {
  final String? label;
  const NotifiedPage({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            TopBar(
              title: Text(
                label.toString().split("|")[0],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 400,
                  width: 300,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.amber,
                  ),
                  child: Text(
                    label.toString().split("|")[1],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
