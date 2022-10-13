import 'package:assignment/features/users/presentation/bloc/user_todos_bloc/user_todos_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/todo.dart';

class UserAddTodoPage extends StatefulWidget {
  const UserAddTodoPage({super.key});

  @override
  State<UserAddTodoPage> createState() => _UserAddTodoPageState();
}

class _UserAddTodoPageState extends State<UserAddTodoPage> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF363f93),
        ),
        body: BlocListener<UserTodosBloc, UserTodosState>(
            listener: (context, state) {
              if (state is UserTodosLoaded) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('Todo Added')));
              }
            },
            child: Card(
              margin: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _inputField('Id', _idController),
                  _inputField('Task', _titleController),
                  ElevatedButton(
                    onPressed: () {
                      var todo = Todo(
                          user_id: 101,
                          id: int.parse(_idController.text),
                          title: _titleController.text,
                          completed: false);
                      context
                          .read<UserTodosBloc>()
                          .add(AddUserTodoEvent(todo: todo));
                      Navigator.pop(context);
                    },
                    child: Text('Add Todo'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF363f93)),
                  )
                ],
              ),
            )));
  }

  Column _inputField(String title, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$title',
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
        Container(
          height: 50,
          margin: EdgeInsets.only(bottom: 10),
          width: double.infinity,
          child: TextFormField(
            controller: controller,
          ),
        )
      ],
    );
  }
}
