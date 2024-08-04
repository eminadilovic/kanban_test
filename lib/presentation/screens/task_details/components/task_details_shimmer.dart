import 'package:flutter/material.dart';
import 'package:kanban_test/core/constants/colors.dart';
import 'package:shimmer/shimmer.dart';

class TaskDetailsShimmer extends StatefulWidget {
  const TaskDetailsShimmer({super.key});

  @override
  State<TaskDetailsShimmer> createState() => _TaskDetailsShimmerState();
}

class _TaskDetailsShimmerState extends State<TaskDetailsShimmer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: 100.0,
            child: Shimmer.fromColors(
              baseColor: CustomColors.grey,
              highlightColor: CustomColors.black.withOpacity(0.6),
              child: Container(
                width: 250.0,
                height: 20.0,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            height: 200.0,
            child: Shimmer.fromColors(
              baseColor: CustomColors.grey,
              highlightColor: CustomColors.black.withOpacity(0.6),
              child: Container(
                width: 250.0,
                height: 20.0,
                color: CustomColors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            height: 50.0,
            child: Shimmer.fromColors(
              baseColor: CustomColors.grey,
              highlightColor: CustomColors.black.withOpacity(0.6),
              child: Container(
                width: 250.0,
                height: 20.0,
                color: CustomColors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            height: 50.0,
            child: Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.black45,
              child: Container(
                width: 250.0,
                height: 20.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
