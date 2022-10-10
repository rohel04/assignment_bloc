import 'package:assignment/features/posts/presentation/bloc/Post_bloc/post_bloc.dart';
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
  }

  @override
  Widget build(BuildContext buildcontext) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Details'),
      ),
      body: Container(child: BlocBuilder<PostBloc, PostState>(
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
    );
  }
}
