import 'package:appflowy_board/appflowy_board.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_test/core/constants/sections.dart';
import 'package:kanban_test/core/utils/amplitude_service.dart';
import 'package:kanban_test/domain/models/task/task.dart';
import 'package:kanban_test/presentation/blocs/task/task_bloc.dart';
import 'package:kanban_test/presentation/screens/board/components/add_task_popup.dart';
import 'package:kanban_test/presentation/screens/board/components/task_container.dart';
import 'package:kanban_test/service_locator.dart';

class BoardWidget extends StatefulWidget {
  final List<Task> tasks;
  const BoardWidget({
    super.key,
    required this.tasks,
  });

  @override
  State<BoardWidget> createState() => _BoardWidgetState();
}

class _BoardWidgetState extends State<BoardWidget> {
  late AppFlowyBoardScrollController boardController;
  late AppFlowyBoardController controller;

  @override
  void initState() {
    super.initState();
    controller = AppFlowyBoardController(
      onMoveGroupItemToGroup: (fromGroupId, fromIndex, toGroupId, toIndex) {
        sl<AmplitudeService>().logEvent("Task_moved");

        debugPrint('Move $fromGroupId:$fromIndex to $toGroupId:$toIndex');
        var taskId =
            controller.getGroupController(toGroupId)?.items.elementAt(toIndex);
        Task task = widget.tasks.firstWhere((x) => x.id == taskId.toString());
        var priority = toGroupId == '3'
            ? priorities[Priority.done]
            : toGroupId == '2'
                ? priorities[Priority.inProgress]
                : toGroupId == '1'
                    ? priorities[Priority.todo]
                    : priorities[Priority.done];
        if (priority != task.priority) {
          Task updatedTask = task.copyWith(priority: priority);
          context.read<TaskBloc>().updateTask(updatedTask);
        }
      },
    );
  }

  void createGroups() {
    controller.clear();
    boardController = AppFlowyBoardScrollController();
    final group1 = AppFlowyGroupData(
        id: "1",
        name: "To Do",
        items: List<AppFlowyGroupItem>.from(widget.tasks
            .where((x) => x.priority == priorities[Priority.todo])
            .map((x) => RichTextItem(
                title: x.content,
                description: x.description ?? "",
                identificator: x.id,
                numberOfComments: x.comment_count ?? 0))
            .toList()));
    final group2 = AppFlowyGroupData(
        id: "2",
        name: "In Progress",
        items: List<AppFlowyGroupItem>.from(widget.tasks
            .where((x) => x.priority == priorities[Priority.inProgress])
            .map((x) => RichTextItem(
                title: x.content,
                description: x.description ?? "",
                identificator: x.id,
                numberOfComments: x.comment_count ?? 0))
            .toList()));
    final group3 = AppFlowyGroupData(
        id: "3",
        name: "Done",
        items: List<AppFlowyGroupItem>.from(widget.tasks
            .where((x) => x.priority == priorities[Priority.done])
            .map((x) => RichTextItem(
                title: x.content,
                description: x.description ?? "",
                identificator: x.id,
                numberOfComments: x.comment_count ?? 0))
            .toList()));
    controller.addGroup(group1);
    controller.addGroup(group2);
    controller.addGroup(group3);
  }

  @override
  Widget build(BuildContext context) {
    createGroups();

    final config = AppFlowyBoardConfig(
        groupBackgroundColor: Colors.grey.withOpacity(0.4),
        stretchGroupHeight: true,
        groupMargin: const EdgeInsets.all(10));
    return AppFlowyBoard(
        controller: controller,
        cardBuilder: (context, group, groupItem) {
          return AppFlowyGroupCard(
            key: ValueKey(groupItem.id),
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20)),
            child: _buildCard(groupItem),
          );
        },
        boardScrollController: boardController,
        footerBuilder: (context, columnData) {
          return AppFlowyGroupFooter(
            icon: const Icon(Icons.add, size: 20),
            title: Text(tr('new')),
            height: 50,
            margin: config.groupBodyPadding,
            onAddButtonClick: () {
              sl<AmplitudeService>().logEvent("task_add_from_footer");

              _showPopup(context, columnData.id);
              boardController.scrollToBottom(columnData.id);
            },
          );
        },
        headerBuilder: (context, columnData) {
          return AppFlowyGroupHeader(
            icon: const Icon(Icons.lightbulb_circle),
            title: FittedBox(
              child: Text(columnData.headerData.groupName),
            ),
            addIcon: const Icon(Icons.add, size: 20),
            height: 50,
            margin: config.groupBodyPadding,
            onAddButtonClick: () {
              _showPopup(context, columnData.id);
              sl<AmplitudeService>().logEvent("task_add_from_header");

              boardController.scrollToBottom(columnData.id);
            },
          );
        },
        groupConstraints: const BoxConstraints.tightFor(width: 240),
        config: config);
  }

  void _showPopup(BuildContext context, String columnId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return TaskDetailsPopup(columnId: columnId);
      },
    );
  }

  Widget _buildCard(AppFlowyGroupItem item) {
    if (item is RichTextItem) {
      return TaskContainer(
          title: item.title,
          description: item.description,
          id: item.id,
          numberOfComments: item.numberOfComments);
    } else {
      throw UnimplementedError();
    }
  }
}

class RichTextItem extends AppFlowyGroupItem {
  final String title;
  final String description;
  final String identificator;
  final int numberOfComments;

  RichTextItem({
    required this.identificator,
    required this.numberOfComments,
    required this.title,
    required this.description,
  });

  @override
  String get id => identificator;
}
