import 'package:flutter/material.dart';

class WorkshopHeader extends StatelessWidget {
  const WorkshopHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '工作室',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          // //TODO 设置
          // IconButton(
          //   onPressed: () {},
          //   icon: const Icon(Icons.settings, color: Colors.white),
          // ),
        ],
      ),
    );
  }
}
