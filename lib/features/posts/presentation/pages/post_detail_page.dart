import 'package:assignment/features/posts/domain/entities/comment.dart';
import 'package:assignment/features/posts/presentation/bloc/Post_bloc/post_bloc.dart';
import 'package:assignment/features/posts/presentation/bloc/comments_bloc/comments_bloc.dart';
import 'package:assignment/features/posts/presentation/widgets/post_comments_widget.dart';
import 'package:assignment/features/posts/presentation/widgets/post_detail_widget.dart';
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
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
        title: Text('Post Details'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        iconTheme: IconThemeData(color: Color(0xFF363f93)),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
        child: Column(children: [
          Container(child: BlocBuilder<PostBloc, PostState>(
            builder: (context, state) {
              if (state is Loading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is PostDetailLoaded) {
                return PostDetailSection(state: state);
              } else if (state is ErrorState) {
                return Text('${state.message}');
              } else {
                return Text('Something went wrong');
              }
            },
          )),
          SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _textController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20))),
                    hintText: "Write a comment",
                    hintStyle: TextStyle(fontFamily: 'Dosis', fontSize: 12)),
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
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF363f93),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20))),
                  ),
                  child: Text('Add comment'))
            ],
          ),
          SizedBox(height: 10),
          Container(
            height: 50,
            padding: EdgeInsets.fromLTRB(10, 15, 0, 10),
            margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Color(0xFF363f93),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50),
                    topRight: Radius.circular(50))),
            child: Text('All Comments',
                style: Theme.of(context).textTheme.headline2),
          ),
          PostCommentWidget()
        ]),
      ),
    );
  }
}
