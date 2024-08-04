import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kanban_test/core/constants/colors.dart';
import 'package:kanban_test/core/constants/styles.dart';
import 'package:kanban_test/core/routes/app_routes.dart';

class TaskContainer extends StatelessWidget {
  final String title;
  final String description;
  final String id;
  final int numberOfComments;

  const TaskContainer({
    Key? key,
    required this.title,
    required this.description,
    required this.id,
    required this.numberOfComments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(AppRoutes.taskDetailsWithId(id));
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: CustomColors.white.withOpacity(0.6),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.grey.shade200,
          ),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$title",
              style: CustomTextStyles.title,
            ),
            Text(
              "$description",
              style: CustomTextStyles.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              "$numberOfComments " + tr("comments"),
              style: CustomTextStyles.comments,
            ),
          ],
        ),
      ),
    );
  }
}
