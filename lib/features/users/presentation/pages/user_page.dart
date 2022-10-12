import 'package:assignment/features/posts/presentation/bloc/Post_bloc/post_bloc.dart';
import 'package:assignment/features/posts/presentation/pages/post_detail_page.dart';
import 'package:assignment/features/users/presentation/bloc/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/user.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext buildcontext) {
    return SafeArea(
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
                    'All Users',
                    style: TextStyle(
                        fontSize: 25,
                        color: Color(0xFF363f93),
                        fontWeight: FontWeight.bold),
                  ),
                ))
          ]),
        ),
        Expanded(
          child: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
            if (state is UserLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is UserLoaded) {
              return ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  User user = state.users[index];
                  return InkWell(
                    onTap: () async {
                      // await Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => PostDetailPage(
                      //               id: post.id,
                      //             )));

                      // buildcontext.read<PostBloc>().add(GetAllPostEvent());
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
                          Text('${user.name}',
                              style: Theme.of(context).textTheme.headline3),
                          SizedBox(height: 10),
                          Text('${user.email}',
                              style: Theme.of(context).textTheme.bodyText1),
                          Text(
                              "${user.address['street']},${user.address['city']}",
                              style: Theme.of(context).textTheme.bodyText1),
                          Text('${user.phone}',
                              style: Theme.of(context).textTheme.bodyText1),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (state is UserError) {
              return Text('${state.message}');
            } else {
              return Text('Hold on');
            }
          }),
        ),
      ]),
    );
  }
}
