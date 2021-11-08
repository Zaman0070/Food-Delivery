/*Provider*/
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zcart/data/controller/blog/blog_state.dart';
import 'package:zcart/data/models/blog/blog_list_model.dart';
import 'package:zcart/data/models/blog/blog_model.dart';
import 'package:zcart/data/network/api.dart';
import 'package:zcart/data/network/network_exception.dart';
import 'package:zcart/data/network/network_utils.dart';

/*Provider*/
final blogsProvider = StateNotifierProvider<BlogsRepository, BlogsState>(
    (ref) => BlogsRepository());
final blogProvider =
    StateNotifierProvider<BlogRepository, BlogState>((ref) => BlogRepository());

/*Repository & Notifier class Combined*/

/// Blog list
class BlogsRepository extends StateNotifier<BlogsState> {
  BlogsRepository() : super(BlogsInitialState());

  Future blogs() async {
    state = BlogsLoadingState();
    print(state);
    var responseBody;
    try {
      responseBody = await handleResponse(await getRequest(API.blogs));
      if (responseBody is int) if (responseBody > 206) throw NetworkException();
      BlogsModel blogsModel = BlogsModel.fromJson(responseBody);
      print(state);
      state = BlogsLoadedState(blogsModel.data);
    } on NetworkException {
      state = BlogsErrorState("Failed to fetch coupon data!");
    }
  }
}

/// Blog details
class BlogRepository extends StateNotifier<BlogState> {
  BlogRepository() : super(BlogInitialState());

  Future blog(slug) async {
    state = BlogLoadingState();
    var responseBody;
    try {
      responseBody = await handleResponse(await getRequest(API.blog(slug)));
      if (responseBody is int) if (responseBody > 206) throw NetworkException();
      BlogModel blogModel = BlogModel.fromJson(responseBody);
      print(state);
      state = BlogLoadedState(blogModel.data);
    } on NetworkException {
      state = BlogErrorState("Failed to fetch coupon data!");
    }
  }
}
