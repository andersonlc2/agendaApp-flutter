import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lista_tarefas/home/repository/task_bindings.dart';

import 'home/add_page/add_page.dart';
import 'home/comp_page/comp_page.dart';
import 'home/edit_page/edit_page.dart';
import 'home/edit_page/teste.dart';
import 'home/home_page.dart';
import 'home/todos_page/todos_page.dart';

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
      initialRoute: '/home',
      getPages: [
        GetPage(name: '/home', page: () => HomePage(), binding: TaskBindings()),
        GetPage(name: '/add', page: () => AddPage()),
        GetPage(name: '/all', page: () => AllPage()),
        GetPage(name: '/comp', page: () => CompPage()),
        GetPage(name: '/edit/:data', page: () => EditPage2())
      ],
    );
  }
}
