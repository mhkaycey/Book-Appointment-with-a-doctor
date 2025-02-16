import 'package:doctor_app/views/screens/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';

class TopBar extends StatelessWidget {
  final Widget? title;
  const TopBar({
    super.key,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(IconlyBold.arrowLeftSquare, size: 30),
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
            Get.offAll(() => const IndexPage());
          },
          icon: const Icon(
            IconlyBold.home,
            size: 25,
          ),
        ),
      ],
    );
  }
}
