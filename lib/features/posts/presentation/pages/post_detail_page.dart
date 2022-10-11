import 'package:assignment/features/posts/domain/entities/comment.dart';
import 'package:assignment/features/posts/presentation/bloc/Post_bloc/post_bloc.dart';
import 'package:assignment/features/posts/presentation/bloc/comments_bloc/comments_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostDetailPage extends StatefulWidget {
  int id;
  PostDetailPage({super.key, required this.id});

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  @override
  void initState() {
    super.initState();
    (context).read<PostBloc>().add(GetPostDetailEvent(id: widget.id));
    (context).read<CommentsBloc>().add(GetCommentsEvent(id: widget.id));
  }

  @override
  Widget build(BuildContext buildcontext) {
    final _textController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Post Details'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          icon: Icon(Icons.back_hand),
        ),
      ),
      body: Column(children: [
        Container(child: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            if (state is Loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PostDetailLoaded) {
              return Card(
                child: Column(
                  children: [
                    Text('${state.post.title}'),
                    Text('${state.post.body}')
                  ],
                ),
              );
            } else {
              return Text('Something went wrong');
            }
          },
        )),
        Column(
          children: [
            TextField(
              controller: _textController,
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<CommentsBloc>().add(AddCommentEvent(
                      id: 101,
                      postId: 101,
                      name: "Rohel",
                      email: "rohelshk@gmail.com",
                      body: _textController.text));
                },
                child: Text('Add comment'))
          ],
        ),
        Expanded(child: BlocBuilder<CommentsBloc, CommentsState>(
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
                    return ListTile(title: Text('${comments.name}'));
                  });
            } else {
              return Text('Try again');
            }
          }),
        ))
      ]),
    );
  }
}
