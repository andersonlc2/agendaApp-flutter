import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;

import '../../model/task_model.dart';

class EditPage extends StatefulWidget {
  const EditPage({Key? key}) : super(key: key);

  @override
  State<EditPage> createState() => _EditPage();
}

Future<TaskModel?> createTask(
    String title, String description, String completed) async {
  final response = await http.post(
      Uri.parse('https://app-agend-todo.herokuapp.com/api/todos/'),
      body: {
        "title": title,
        "description": description,
        "completed": completed
      });
  if (response.statusCode == 201) {
    final String responseString = response.body;

    return TaskModel.fromJson(responseString);
  } else {
    return null;
  }
}

class _EditPage extends State<EditPage> {
  TaskModel? _task;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descrController = TextEditingController();
  bool isChecked = false;
  bool checkboxValue = false;
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
