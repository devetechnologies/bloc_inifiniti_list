import 'package:bloc_infiniti_list/helpers/constants.dart';

import '../post/models/post_model.dart';
import 'http_services.dart';

class PostsApi {
  final HttpServices _httpServices = HttpServices();
  List<PostModel> posts = [];

  Future<List<PostModel>> getPosts([int startIndex = 0, int limit = 20]) async {
    try {
      String url = '${BASE_URL}posts?_start=$startIndex&_limit=$limit';
      var response = await _httpServices.getResquest(url);
      if (response.statusCode == 200) {
        final list = List.from(response.data);
        for (var element in list) {
          final PostModel post = PostModel.fromJson(element);
          posts.add(post);
        }
      }
    } catch (e) {
      print(e);
    }
    return posts;
  }
}
