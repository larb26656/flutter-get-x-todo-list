import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:todo_list/model/task_dto.dart';
import 'package:todo_list/route_management.dart';
import 'package:todo_list/style/color_palettes.dart';
import 'package:todo_list/style/dimensions.dart';
import 'package:todo_list/style/text_size.dart';
import 'package:todo_list/widget/dashboard_tile.dart';
import 'package:todo_list/widget/task_card.dart';
import 'package:todo_list/widget/text_indicator_card.dart';

import 'logic.dart';

class ProfilePage extends StatelessWidget {
  final logic = Get.find<ProfileLogic>();

  Widget _profileDetail() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  blurRadius: 4,
                  spreadRadius: 0,
                  color: ColorPalettes.black.withOpacity(0.5),
                  offset: const Offset(0, 5))
            ],
          ),
          child: const CircleAvatar(
            radius: 70.0,
            backgroundColor: ColorPalettes.light,
            child: CircleAvatar(
              radius: 65.0,
              backgroundImage: NetworkImage(
                  "https://upload.wikimedia.org/wikipedia/commons/b/b1/VAN_CAT.png"),
              backgroundColor: Colors.transparent,
            ),
          ),
        ),
        const SizedBox(
          height: Dimensions.spacePadding3,
        ),
        const Text("Shoto Todoroki",
            style: TextStyle(
                fontSize: TextSize.t6Size,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        const SizedBox(
          height: Dimensions.spacePadding2,
        ),
        const Text("Student",
            style: TextStyle(fontSize: TextSize.t3Size, color: Colors.white)),
      ],
    );
  }

  Widget _socialDetail() {
    return Container(
      padding: const EdgeInsets.all(Dimensions.spacePadding4),
      decoration: const BoxDecoration(
        color: ColorPalettes.light,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => const FollowerPage()));
                },
                child: const Center(
                  child: DashBoardTile(
                    value: "9M",
                    label: "Followers",
                  ),
                ),
              ),
            ),
            const VerticalDivider(
              color: ColorPalettes.primary,
              thickness: 5, //thickness of divier line
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => const FollowingPage()));
                },
                child: const Center(
                  child: DashBoardTile(
                    value: "1,660",
                    label: "Following",
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _taskList() {
    return Obx(() {
      if (logic.isLoading.value) {
        return const SpinKitSquareCircle(
          color: ColorPalettes.primary,
          size: 50.0,
        );
      } else {
        return Obx(() {
          return ListView.separated(
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                    height: Dimensions.spacePadding3,
                  ),
              padding: const EdgeInsets.all(Dimensions.spacePadding3),
              itemCount: logic.taskList.length,
              itemBuilder: (BuildContext ctxt, int index) {
                TaskDto task = logic.taskList[index];

                return TaskCard(
                  onTaskTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => TaskDetailPage(
                    //         task: task,
                    //       )),
                    // ).then((value) {
                    //   if (value != null) {
                    //     if (value) {
                    //       setState(() {
                    //         taskList.removeAt(index);
                    //       });
                    //     }
                    //   }
                    //   return value;
                    // });
                  },
                  onDoneTap: () {
                    // showDialog<bool>(
                    //     context: context,
                    //     barrierDismissible: false, // user must tap button!
                    //     builder: (BuildContext context) {
                    //       return const DoneTaskDialog();
                    //     }).then((value) {
                    //   if (value != null) {
                    //     if (value) {
                    //       setState(() {
                    //         taskList.removeAt(index);
                    //       });
                    //     }
                    //   }
                    //   return value;
                    // });
                  },
                  task: task,
                );
              });
        });
      }
    });
  }

  Widget _addTaskBtn() {
    return FloatingActionButton(
        backgroundColor: ColorPalettes.secondary,
        onPressed: () {
          Get.toNamed(RouterManagement.taskForm)?.then((value) {
            if (value != null) {
              if (value) {
                logic.searchTask();
              }
            }
            return value;
          });
        },
        tooltip: 'Add task',
        child: const Icon(Icons.add));
  }

  Widget _taskListIndicator() {
    return Obx(() {
      return TextIndicatorCard(
        label: '${logic.taskList.length} Tasks remain',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 400,
              color: ColorPalettes.primary,
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(Dimensions.spacePadding4),
                      child: _profileDetail(),
                    ),
                  ),
                  _socialDetail()
                ],
              ),
            ),
            Expanded(
              child: _taskList(),
            ),
            _taskListIndicator()
          ],
        ),
      ),
      floatingActionButton: _addTaskBtn(),
    );
  }
}
