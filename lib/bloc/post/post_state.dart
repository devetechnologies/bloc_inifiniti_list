part of 'post_bloc.dart';

enum PostStatus { initial, success, failure }

final class PostState extends Equatable {
  final PostStatus status;
  final List<PostModel> posts;
  final bool isMax;

  const PostState(
      {this.status = PostStatus.initial,
      this.posts = const <PostModel>[],
      this.isMax = false});

  PostState copyPost({
    PostStatus? status,
    List<PostModel>? posts,
    bool? isMax,
  }) {
    return PostState(
        status: status ?? this.status,
        posts: posts ?? this.posts,
        isMax: isMax ?? this.isMax);
  }

  @override
  List<Object> get props => [status, posts, isMax];
}

//final class PostInitial extends PostState {}
