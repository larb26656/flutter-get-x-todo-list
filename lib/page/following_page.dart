import 'package:flutter/material.dart';
import 'package:todo_list/model/user_dto.dart';
import 'package:todo_list/style/dimensions.dart';
import 'package:todo_list/widget/text_indicator_card.dart';
import 'package:todo_list/widget/user_card.dart';

class FollowingPage extends StatefulWidget {
  const FollowingPage({Key? key}) : super(key: key);

  @override
  _FollowingPageState createState() => _FollowingPageState();
}

class _FollowingPageState extends State<FollowingPage> {

  List<UserDto> followingList = [];

  Widget _followingList () {
    return ListView.separated(
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          height: Dimensions.spacePadding3,
        ),
        padding: const EdgeInsets.all(Dimensions.spacePadding3),
        itemCount: followingList.length,
        itemBuilder: (BuildContext ctxt, int index) {
          UserDto user = followingList[index];
          return UserCard(
            user: user,
          );
        });
  }


  Widget _taskListIndicator() {
    return TextIndicatorCard(
      label: '${followingList.length} Following',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Following'
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(child: _followingList()),
          _taskListIndicator()
        ],
      ),
    );
  }
}
