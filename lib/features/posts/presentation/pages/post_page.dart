import 'package:assignment/features/posts/presentation/bloc/Post_bloc/post_bloc.dart';
import 'package:assignment/features/posts/presentation/pages/post_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/post.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext buildcontext) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Container(
            height: 110,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: Color(0xFF363f93)),
            child: Stack(children: [
              Positioned(
                top: 25,
                left: 0,
                child: Container(
                  height: 60,
                  width: 230,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      )),
                ),
              ),
              Positioned(
                  top: 40,
                  left: 20,
                  child: Center(
                    child: Text(
                      'All Posts',
                      style: TextStyle(
                          fontSize: 25,
                          color: Color(0xFF363f93),
                          fontWeight: FontWeight.bold),
                    ),
                  ))
            ]),
          ),
          Expanded(
            child: BlocBuilder<PostBloc, PostState>(builder: (context, state) {
              if (state is Loading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is PostLoaded) {
                return ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: state.posts.length,
                  itemBuilder: (context, index) {
                    Post post = state.posts[index];
                    return InkWell(
                      onTap: () async {
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PostDetailPage(
                                      id: post.id,
                                    )));

                        buildcontext.read<PostBloc>().add(GetAllPostEvent());
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                        decoration: BoxDecoration(
                            color: Color(0xFF363f93),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(50))),
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${post.title}',
                                style: Theme.of(context).textTheme.headline3),
                            SizedBox(height: 10),
                            Text('${post.body}',
                                maxLines: 2,
                                style: Theme.of(context).textTheme.bodyText1)
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else {
                return Text('Try again');
              }
            }),
          ),
        ]),
      ),
    );
  }
}
