import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/comment.dart';
import '../bloc/comments_bloc/comments_bloc.dart';

class PostCommentWidget extends StatefulWidget {
  const PostCommentWidget({super.key});

  @override
  State<PostCommentWidget> createState() => _PostCommentWidgetState();
}

class _PostCommentWidgetState extends State<PostCommentWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(child: BlocBuilder<CommentsBloc, CommentsState>(
      builder: ((context, state) {
        if (state is CommentLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is CommentsLoaded) {
          return ListView.builder(
              itemCount: state.comments.length,
              itemBuilder: (context, index) {
                Comments comments = state.comments[index];
                return Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                    decoration: BoxDecoration(
                        color: Color(0xFF363f93),
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(50))),
                    child: ListTile(
                      title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${comments.name}',
                                style: Theme.of(context).textTheme.headline3),
                            Text('${comments.email}',
                                style: Theme.of(context).textTheme.bodyText1),
                            SizedBox(height: 5),
                          ]),
                      subtitle: Text('${comments.body}',
                          style: Theme.of(context).textTheme.bodyText1),
                    ));
              });
        } else if (state is CommentError) {
          return Text('${state.message}');
        } else {
          return Text('Try again');
        }
      }),
    ));
  }
}
