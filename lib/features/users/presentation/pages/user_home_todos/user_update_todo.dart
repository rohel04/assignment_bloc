import 'package:assignment/features/users/presentation/bloc/user_todos_bloc/user_todos_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/todo.dart';

class UserUpdateTodoPage extends StatefulWidget {
  Todo todo;
  UserUpdateTodoPage({super.key, required this.todo});

  @override
  State<UserUpdateTodoPage> createState() => _UserUpdateTodoPageState();
}

class _UserUpdateTodoPageState extends State<UserUpdateTodoPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleController.text = widget.todo.title!;
  }

  TextEditingController _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF363f93),
          actions: [
            IconButton(
                onPressed: () {
                  context
                      .read<UserTodosBloc>()
                      .add(DeleteUserTodoEvent(todo: widget.todo));
                  Navigator.pop(context);
                },
                icon: Icon(Icons.delete))
          ],
        ),
        body: BlocListener<UserTodosBloc, UserTodosState>(
            listener: (context, state) {
              if (state is UserTodosLoaded) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('Todo Updated')));
              }
            },
            child: Card(
                child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _inputField('Task', _titleController),
                  ElevatedButton(
                    onPressed: () {
                      var todo = Todo(
                          user_id: widget.todo.user_id,
                          id: widget.todo.id,
                          title: _titleController.text,
                          completed: false);
                      context
                          .read<UserTodosBloc>()
                          .add(UpdateUserTodoEvent(todo: todo));
                      Navigator.pop(context);
                    },
                    child: Text('Update Todo'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF363f93)),
                  )
                ],
              ),
            ))));
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
