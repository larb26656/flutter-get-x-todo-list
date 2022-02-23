import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/default_route.dart';
import 'package:todo_list/page/profile/binding.dart';
import 'package:todo_list/page/profile/view.dart';
import 'package:todo_list/page/task_form/binding.dart';
import 'package:todo_list/page/task_form/view.dart';

class RouterManagement {
  static const String home = '/';
  static const String taskForm = '/task/form';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case home:
        return GetPageRoute(
          routeName: settings.name,
          page: () => ProfilePage(),
          binding: ProfileBinding(),
        );
      case taskForm:
        return GetPageRoute(
          routeName: settings.name,
          page: () => TaskFormPage(),
          binding: TaskFormBinding(),
        );
      default:
        return GetPageRoute(
            page: () =>
                Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}