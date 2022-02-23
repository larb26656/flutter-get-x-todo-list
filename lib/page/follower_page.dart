import 'package:flutter/material.dart';
import 'package:todo_list/model/user_dto.dart';
import 'package:todo_list/page/user_detail_page.dart';
import 'package:todo_list/style/dimensions.dart';
import 'package:todo_list/widget/text_indicator_card.dart';
import 'package:todo_list/widget/user_card.dart';

class FollowerPage extends StatefulWidget {
  const FollowerPage({Key? key}) : super(key: key);

  @override
  _FollowerPageState createState() => _FollowerPageState();
}

class _FollowerPageState extends State<FollowerPage> {

  List<UserDto> followerList = [
    UserDto("", "Nezu", "Principal", 1, 1, []),
    UserDto("", "All Might", "Heroics Teacher", 1, 1, [])
  ];

  Widget _followerList () {
    return ListView.separated(
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          height: Dimensions.spacePadding3,
        ),
        padding: const EdgeInsets.all(Dimensions.spacePadding3),
        itemCount: followerList.length,
        itemBuilder: (BuildContext ctxt, int index) {
          UserDto user = followerList[index];
          return UserCard(
            user: user,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => UserDetailPage()));
            },
          );
        });
  }


  Widget _taskListIndicator() {
    return TextIndicatorCard(
      label: '${followerList.length} Followers',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Followers'
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(child: _followerList()),
          _taskListIndicator()
        ],
      ),
    );
  }
}
