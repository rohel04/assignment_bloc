import 'package:assignment/features/users/presentation/bloc/user_todos_bloc/user_todos_bloc.dart';
import 'package:assignment/features/users/presentation/pages/user_home_todos/user_add_todo.dart';
import 'package:assignment/features/users/presentation/pages/user_home_todos/user_update_todo.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/todo.dart';

class UserTodo extends StatefulWidget {
  int id;
  UserTodo({super.key, required this.id});

  @override
  State<UserTodo> createState() => _UserTodoState();
}

class _UserTodoState extends State<UserTodo> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<UserTodosBloc>().add(GetUserTodosEvent(id: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => UserAddTodoPage()));
        },
        child: Icon(Icons.add),
      ),
      body: Container(child:
          BlocBuilder<UserTodosBloc, UserTodosState>(builder: (context, state) {
        if (state is UserTodosLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is UserTodosLoaded) {
          return ListView.builder(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
              itemCount: state.todos.length,
              itemBuilder: (context, index) {
                Todo todo = state.todos[index];
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                  decoration: BoxDecoration(
                      color: Color(0xFF363f93),
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(50))),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  UserUpdateTodoPage(todo: todo)));
                    },
                    trailing: Checkbox(
                      activeColor: Colors.white,
                      checkColor: Colors.black,
                      value: todo.completed,
                      onChanged: (bool? value) {
                        todo.completed = value;
                      },
                    ),
                    contentPadding: EdgeInsets.all(0),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${todo.title}',
                            style: Theme.of(context).textTheme.headline3),
                        SizedBox(height: 5)
                      ],
                    ),
                  ),
                );
              });
        } else {
          return Text('Hold On!!');
        }
      })),
    );
  }
}
