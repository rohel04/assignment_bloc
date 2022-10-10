import 'package:assignment/features/posts/presentation/bloc/Post_bloc/post_bloc.dart';
import 'package:assignment/features/posts/presentation/pages/post_page.dart';
import 'package:flutter/material.dart';
import 'package:assignment/injection_container.dart' as di;
import 'features/posts/presentation/bloc/comments_bloc/comments_bloc.dart';
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
      ],
      child: MaterialApp(
        home: PostPage(),
      ),
    );
  }
}
