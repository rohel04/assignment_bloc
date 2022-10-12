import 'package:assignment/home.dart';
import 'package:assignment/features/posts/presentation/bloc/Post_bloc/post_bloc.dart';
import 'package:assignment/features/posts/presentation/pages/post_page.dart';
import 'package:flutter/material.dart';
import 'package:assignment/injection_container.dart' as di;
import 'features/posts/presentation/bloc/comments_bloc/comments_bloc.dart';
import 'features/users/presentation/bloc/user_bloc/user_bloc.dart';
import 'features/users/presentation/bloc/user_posts_bloc/user_posts_bloc.dart';
import 'injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => sl<PostBloc>()..add(GetAllPostEvent())),
        BlocProvider(create: (context) => sl<CommentsBloc>()),
        BlocProvider(
            create: (context) => sl<UserBloc>()..add(GetAllUserEvent())),
        BlocProvider(create: (context) => sl<UserPostsBloc>()),
      ],
      child: MaterialApp(
        theme: ThemeData(
            textTheme: TextTheme(
                headline1: TextStyle(
                    fontSize: 25,
                    color: Color(0xFF363f93),
                    fontWeight: FontWeight.bold),
                headline2: TextStyle(
                    fontFamily: 'Dosis',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                headline3: TextStyle(
                    fontFamily: 'Dosis',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                bodyText1: TextStyle(
                    fontFamily: 'Dosis', fontSize: 12, color: Colors.white))),
        home: Home(),
      ),
    );
  }
}
