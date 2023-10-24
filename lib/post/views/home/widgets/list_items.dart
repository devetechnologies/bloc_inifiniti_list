import 'package:bloc_infiniti_list/post/models/post_model.dart';
import 'package:flutter/material.dart';

class ListItems extends StatelessWidget {
  final PostModel postModel;

  const ListItems({super.key, required this.postModel});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
            tileColor: Colors.indigo,
            textColor: Colors.white,
            iconColor: Colors.white,
            isThreeLine: true,
            leading: Text('${postModel.id}', style: textTheme.bodySmall),
            title: Text(postModel.title),
            subtitle: Text(postModel.body),
          ),
        ),
        const Divider(
          height: 4,
        ),
      ],
    );
  }
}
