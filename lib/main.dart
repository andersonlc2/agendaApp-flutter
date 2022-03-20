import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lista_tarefas/home/repository/task_bindings.dart';

import 'home/add_page.dart';
import 'home/home_page.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
            name: '/',
            page: () => HomePage(),
            binding: TaskBindings(),
            children: [GetPage(name: '/add', page: () => AddPage())])
      ],
    );
  }
}
