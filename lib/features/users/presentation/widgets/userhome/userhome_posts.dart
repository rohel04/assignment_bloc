import 'package:assignment/features/posts/presentation/bloc/Post_bloc/post_bloc.dart';
import 'package:assignment/features/users/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:assignment/features/users/presentation/bloc/user_posts_bloc/user_posts_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection_container.dart';
import '../../../../posts/domain/entities/post.dart';

class UserPostsWidget extends StatefulWidget {
  int id;

  UserPostsWidget({super.key, required this.id});

  @override
  State<UserPostsWidget> createState() => _UserPostsWidgetState();
}

class _UserPostsWidgetState extends State<UserPostsWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    (context).read<UserPostsBloc>().add(GetUserAllPostsEvent(id: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
          BlocBuilder<UserPostsBloc, UserPostsState>(builder: (context, state) {
        if (state is UserPostsLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is UserPostsLoaded) {
          return ListView.builder(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                Post posts = state.posts[index];
                return InkWell(
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPageTest(id: posts.id)));
                  },
                  child: Container(
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
                          Text('${posts.title}',
                              style: Theme.of(context).textTheme.headline3),
                          SizedBox(height: 5)
                        ],
                      ),
                      subtitle: Text('${posts.body}',
                          style: Theme.of(context).textTheme.bodyText1),
                    ),
                  ),
                );
              });
        } else if (state is UserPostsError) {
          return Text('${state.message}');
        } else {
          return Text('Hold On !!');
        }
      }),
    );
  }
}
