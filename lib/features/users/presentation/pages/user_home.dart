import 'package:assignment/features/users/presentation/widgets/userhome/userhome_albums.dart';
import 'package:assignment/features/users/presentation/widgets/userhome/userhome_posts.dart';
import 'package:assignment/features/users/presentation/widgets/userhome/userhome_todos.dart';
import 'package:flutter/material.dart';

class UserHomePage extends StatefulWidget {
  int id;
  UserHomePage({super.key, required this.id});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Color(0xFF363f93),
          bottom: PreferredSize(
            preferredSize:
                Size.fromHeight(MediaQuery.of(context).size.height * 0.07),
            child: TabBar(
              tabs: [
                Tab(
                  text: 'Posts',
                  icon: Icon(Icons.post_add_sharp, color: Colors.white),
                ),
                Tab(text: 'Todos', icon: Icon(Icons.list, color: Colors.white)),
                Tab(
                    text: 'Albums',
                    icon: Icon(Icons.list, color: Colors.white)),
              ],
              indicatorColor: Colors.white,
              labelColor: Colors.white,
            ),
          ),
        ),
        body: TabBarView(children: [
          UserPostsWidget(id: widget.id),
          UserTodo(
            id: widget.id,
          ),
          UserAlbums(id: widget.id)
        ]),
      ),
    );
  }
}
