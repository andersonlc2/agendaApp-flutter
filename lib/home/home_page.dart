import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:lista_tarefas/home/repository/task_controller.dart';
import 'package:lista_tarefas/model/task_model.dart';

class HomePage extends GetView<TaskController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text("Annonimous"),
              accountEmail: Text("announimous@gmail.com"),
              currentAccountPicture: CircleAvatar(
                  child: Icon(
                Icons.account_circle,
              )),
            ),
            ListTile(
                leading: const Icon(Icons.list),
                title: const Text("Todas tarefas"),
                onTap: () {
                  Navigator.pop(context);
                }),
            ListTile(
                leading: const Icon(Icons.indeterminate_check_box_outlined),
                title: const Text("Incompletas"),
                onTap: () {
                  Navigator.pop(context);
                }),
            ListTile(
                leading: const Icon(Icons.check),
                title: const Text("Concuídas"),
                onTap: () {
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('AgendaApp'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SizedBox(
                child: controller.obx((state) {
                  return ListView.builder(
                    itemCount: state.length,
                    itemBuilder: (_, index) {
                      final TaskModel item = state[index];
                      return Card(
                          shadowColor: Colors.black,
                          margin: EdgeInsets.all(15),
                          color: Color.fromARGB(255, 133, 175, 248),
                          child: Column(children: [
                            ListTile(
                                tileColor: Colors.blueAccent,
                                leading: Checkbox(
                                  checkColor: Colors.black,
                                  value: item.completed,
                                  onChanged: (bool? value) {},
                                ),
                                minVerticalPadding: 20,
                                title: Text(item.title.toString())),
                            Padding(
                              padding: EdgeInsets.all(30),
                              child: Text(item.description.toString()),
                            ),
                            Divider(),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    child: TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Editar Tarefa',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white,
                                              fontWeight: FontWeight.normal),
                                        )),
                                  ),
                                ],
                              ),
                            )
                          ]));
                    },
                  );
                }, onError: (error) {
                  return Text(error.toString());
                }),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('/add'),
        child: const Icon(Icons.add_card),
      ),
    );
  }
}
