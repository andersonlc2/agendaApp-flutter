import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;

import '../../model/task_model.dart';
import '../repository/controllers/edit_page_controller.dart';

class EditPage2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EditPageteste();
}

class _EditPageteste extends State<EditPage2> {
  EditPageFormController _controller = Get.put(EditPageFormController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: Text('Editar tarefa')),
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: LayoutBuilder(
                  builder: (_, constraints) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Obx(() => Text("${_controller.id}")),
                        Container(
                            width: constraints.maxWidth * 0.8,
                            height: constraints.maxHeight * 0.5,
                            child: Center(
                              child: Form(
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextFormField(
                                            //controller: titleController,
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(),
                                              labelText: 'Título',
                                              suffixIcon:
                                                  Icon(Icons.task_sharp),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextFormField(
                                            //controller: descrController,
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(),
                                              labelText:
                                                  'Descrição da sua tarefa',
                                              suffixIcon:
                                                  Icon(Icons.description),
                                            ),
                                            maxLines: 4,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Checkbox(
                                            value: false,
                                            onChanged: (bool? value) {},
                                          ),
                                          const Text(
                                            "Tarefa concluída.",
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ],
                                      ),
                                      // Divider(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          TextButton(
                                              style: TextButton.styleFrom(
                                                padding:
                                                    const EdgeInsets.all(16.0),
                                              ),
                                              onPressed: () {}

                                              //setState(() {
                                              //  _task = task;
                                              //});

                                              ,
                                              child: const Text(
                                                'Salvar',
                                                style: TextStyle(fontSize: 18),
                                              ))
                                        ],
                                      )
                                    ]),
                              ),
                            )),
                      ],
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}





/*
class EditPageForm extends GetView<EditPageFormController> {
  const EditPageForm({Key? key}) : super(key: key);

  @override
    Widget build(BuildContext context) {
    return Form(
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextFormField(
                                            controller: titleController,
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(),
                                              labelText: 'Título',
                                              suffixIcon:
                                                  Icon(Icons.task_sharp),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextFormField(
                                            controller: descrController,
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(),
                                              labelText:
                                                  'Descrição da sua tarefa',
                                              suffixIcon:
                                                  Icon(Icons.description),
                                            ),
                                            maxLines: 4,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Checkbox(
                                            value: isChecked,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                isChecked = value!;
                                                if (isChecked == true) {
                                                  checkboxValue = true;
                                                } else {
                                                  checkboxValue = false;
                                                }
                                              });
                                            },
                                          ),
                                          const Text(
                                            "Tarefa concluída.",
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ],
                                      ),
                                      // Divider(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          TextButton(
                                              style: TextButton.styleFrom(
                                                padding:
                                                    const EdgeInsets.all(16.0),
                                              ),
                                              onPressed: () async {
                                                String title = titleController
                                                    .text
                                                    .toString();
                                                String description =
                                                    descrController.text
                                                        .toString();
                                                var completed = isChecked;

                                                // final TaskModel? task =
                                                await createTask(
                                                    title,
                                                    description,
                                                    completed.toString());

                                                //setState(() {
                                                //  _task = task;
                                                //});

                                                print(Get.parameters['data']);

                                                showDialog(
                                                    context: context,
                                                    builder: (BuildContext
                                                            context) =>
                                                        AlertDialog(
                                                          title: const Text(
                                                              'Tudo certo!'),
                                                          contentTextStyle:
                                                              const TextStyle(
                                                            fontSize: 14,
                                                          ),
                                                          content: Text(
                                                              'A tafera foi salva com sucesso!'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                                Get.toNamed(
                                                                    '/home');
                                                              },
                                                              child: const Text(
                                                                  'OK'),
                                                            ),
                                                          ],
                                                        ));
                                              },
                                              child: const Text(
                                                'Salvar',
                                                style: TextStyle(fontSize: 18),
                                              ))
                                        ],
                                      )
                                    ]),
                              );
}
*/