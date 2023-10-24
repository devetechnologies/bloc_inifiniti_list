import 'package:bloc/bloc.dart';
import 'package:bloc_infiniti_list/api/posts_api.dart';
import 'package:bloc_infiniti_list/post/models/post_model.dart';
import 'package:equatable/equatable.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostsApi _postsApi = PostsApi();

  PostBloc() : super(const PostState()) {
    on<GetPostEvent>((event, emit) async {
      await getPosts(event, emit);
    });
  }

  Future<void> getPosts(GetPostEvent event, Emitter<PostState> emit) async {
    try {
      if (state.status == PostStatus.initial) {
        final posts = await _postsApi.getPosts();
        //print('Initit status ${posts.length}');
        return emit(state.copyPost(
            status: PostStatus.success, posts: posts, isMax: false));
      } else {
        final posts = await _postsApi.getPosts(state.posts.length);
        posts.isEmpty
            ? emit(state.copyPost(isMax: true))
            : emit(state.copyPost(
                status: PostStatus.success,
                posts: List.of(state.posts)..addAll(posts),
                isMax: false));
      }
    } catch (e) {
      print(e);
    }
  }
}
