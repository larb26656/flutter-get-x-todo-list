import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/route_management.dart';
import 'package:todo_list/service/task/task_service.dart';
import 'package:todo_list/style/color_palettes.dart';

void injectGetX() {
  Get.lazyPut(() => TaskService(), fenix: true);
}

void main() {
  injectGetX();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: ColorPalettes.primary,
          appBarTheme: const AppBarTheme(
            color: ColorPalettes.primary,
          )),
      onGenerateRoute: RouterManagement.generateRoute,
      initialRoute: RouterManagement.home,
    );
  }
}
