import 'package:bloc_infiniti_list/bloc/post/post_bloc.dart';
import 'package:bloc_infiniti_list/post/views/home/widgets/list_items.dart';
import 'package:bloc_infiniti_list/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostList extends StatefulWidget {
  const PostList({super.key});

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener((_onScroll));
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        switch (state.status) {
          case PostStatus.initial:
            return const LoadingIndicator();
          case PostStatus.success:
            return ListView.builder(
              controller: _scrollController,
              itemCount:
                  state.isMax ? state.posts.length : state.posts.length + 1,
              itemBuilder: (context, index) {
                return index >= state.posts.length
                    ? const LoadingIndicator()
                    : ListItems(
                        postModel: state.posts[index],
                      );
              },
            );
          case PostStatus.failure:
            return const Center(
              child: Text('Error Posts'),
            );
        }
      },
    );
  }

  void _onScroll() {
    if (_isBottom) context.read<PostBloc>().add(GetPostEvent());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
