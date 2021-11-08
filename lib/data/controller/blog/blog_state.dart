import 'package:zcart/data/models/blog/blog_list_model.dart';
import 'package:zcart/data/models/blog/blog_model.dart';

/// Blogs
abstract class BlogsState {
  const BlogsState();
}

class BlogsInitialState extends BlogsState {
  const BlogsInitialState();
}

class BlogsLoadingState extends BlogsState {
  const BlogsLoadingState();
}

class BlogsLoadedState extends BlogsState {
  final List<Blog>? blogList;

  const BlogsLoadedState(this.blogList);
}

class BlogsErrorState extends BlogsState {
  final String message;

  const BlogsErrorState(this.message);
}

/// Blog

abstract class BlogState {
  const BlogState();
}

class BlogInitialState extends BlogState {
  const BlogInitialState();
}

class BlogLoadingState extends BlogState {
  const BlogLoadingState();
}

class BlogLoadedState extends BlogState {
  final BlogDetails? blog;

  const BlogLoadedState(this.blog);
}

class BlogErrorState extends BlogState {
  final String message;

  const BlogErrorState(this.message);
}