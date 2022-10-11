import 'package:flutter/material.dart';

class PostDetailSection extends StatefulWidget {
  var state;
  PostDetailSection({super.key, required this.state});

  @override
  State<PostDetailSection> createState() => _PostDetailSectionState();
}

class _PostDetailSectionState extends State<PostDetailSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(50),
          ),
          color: Color(0xFF363f93)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${widget.state.post.title}',
              style: Theme.of(context).textTheme.headline3),
          SizedBox(height: 5),
          Text('${widget.state.post.body}',
              style: Theme.of(context).textTheme.bodyText1)
        ],
      ),
    );
  }
}
