import 'package:assignment/features/users/presentation/bloc/user_albums_bloc/user_albums_bloc.dart';
import 'package:assignment/features/users/presentation/bloc/user_todos_bloc/user_todos_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/album.dart';

class UserAlbums extends StatefulWidget {
  int id;
  UserAlbums({super.key, required this.id});

  @override
  State<UserAlbums> createState() => _UserAlbumsState();
}

class _UserAlbumsState extends State<UserAlbums> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<UserAlbumsBloc>().add(GetUserAlbumsEvent(id: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Container(child:
        BlocBuilder<UserAlbumsBloc, UserAlbumsState>(builder: (context, state) {
      if (state is UserAlbumsLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is UserAlbumsLoaded) {
        return ListView.builder(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
            itemCount: state.albums.length,
            itemBuilder: (context, index) {
              Album album = state.albums[index];
              return Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                decoration: BoxDecoration(
                    color: Color(0xFF363f93),
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(50))),
                child: ListTile(
                  contentPadding: EdgeInsets.all(10),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${album.title}',
                          style: Theme.of(context).textTheme.headline3),
                      SizedBox(height: 5)
                    ],
                  ),
                ),
              );
            });
      } else if (state is UserAlbumsError) {
        return Text('${state.message}');
      } else {
        return Text('Hold On!!');
      }
    }));
  }
}
