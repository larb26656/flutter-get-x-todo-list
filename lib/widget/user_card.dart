import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/model/user_dto.dart';
import 'package:todo_list/style/color_palettes.dart';
import 'package:todo_list/style/dimensions.dart';

class UserCard extends StatelessWidget {
  final GestureTapCallback? onTap;
  final UserDto user;

  const UserCard({Key? key, this.onTap, required this.user}) : super(key: key);

  Widget _profilePic() {
    return CircleAvatar(
      radius: 27.0,
      backgroundColor: ColorPalettes.light,
      child: CircleAvatar(
        radius: 25.0,
        backgroundImage: NetworkImage(
            "https://upload.wikimedia.org/wikipedia/commons/b/b1/VAN_CAT.png"),
        backgroundColor: Colors.transparent,
      ),
    );
  }

  Widget _profileDetail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(user.name,
          style: const TextStyle(
              color: ColorPalettes.light
          ),),
        const SizedBox(
          height: Dimensions.spacePadding2,
        ),
        Text(user.role,
            style: const TextStyle(
                color: ColorPalettes.light
            )
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.all(Dimensions.spacePadding4),
        color: ColorPalettes.primary,
        child: Row(
          children: [
            _profilePic(),
            const SizedBox(
              width: Dimensions.spacePadding4,
            ),
            _profileDetail()
          ],
      )
      ),
    );
  }
}
