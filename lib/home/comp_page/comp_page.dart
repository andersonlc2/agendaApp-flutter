import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:lista_tarefas/home/repository/controllers/task_controller.dart';
import 'package:lista_tarefas/model/task_model.dart';

import '../repository/controllers/comp_controler.dart';

class CompPage extends GetView<CompController> {
  const CompPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todas as tarefas'),
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
                          margin: const EdgeInsets.all(15),
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
                                        child: const Text(
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
    );
  }
}
