import 'package:flutter/material.dart';
import 'package:flutter_demo/util/app_common_stuffs/colors.dart';

class CustomListTile extends StatelessWidget {
  String? firstName = "Unknown";
  String? lastName = "Person";
  String? subTitle;
  String? time;
  bool isTime = false;
  final Function()? onClick;

  CustomListTile({Key? key, this.subTitle, this.firstName, this.lastName, this.time, required this.isTime, required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onClick,
      title: Text(
        "$firstName $lastName" ?? "",
      ),
      subtitle: Text(
        subTitle ?? "",
      ),
      trailing: Text(
        isTime ? time ?? "" : "",
      ),
      leading: CircleAvatar(
        backgroundColor: AppColors.primaryColor.withOpacity(0.20),
        child: Text(
          '${firstName?[0].toUpperCase() ?? 'U'}${lastName?[0].toUpperCase() ?? 'U'}',
          style: const TextStyle(
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
