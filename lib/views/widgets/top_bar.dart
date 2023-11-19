import 'package:doctor_app/views/screens/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';

class TopBar extends StatelessWidget {
  final Widget? title;
  const TopBar({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(IconlyBold.arrowLeftSquare),
        ),
        const Spacer(),
        title == null
            ? Container()
            : Container(
                child: title,
              ),
        const Spacer(),
        IconButton(
          onPressed: () {
            Get.to(() => const IndexPage());
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => const IndexPage(),
            //   ),
            // );
          },
          icon: const Icon(IconlyBold.home),
        ),
      ],
    );
  }
}
