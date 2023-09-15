import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LineBar extends StatelessWidget {
  final int maxValue;
  final int value;

  const LineBar({super.key, this.maxValue = 100, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: value,
          child: Divider(
            color: value > (maxValue / 2) ? Colors.green : Colors.red,
            thickness: 3,
          ),
        ),
        Flexible(
          flex: maxValue - value,
          child: const Divider(),
        ),
      ],
    );
  }
}
