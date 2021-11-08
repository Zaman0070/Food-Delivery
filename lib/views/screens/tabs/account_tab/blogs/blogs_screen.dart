import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zcart/data/controller/blog/blog_controller.dart';
import 'package:zcart/data/controller/blog/blog_state.dart';
import 'package:zcart/translations/locale_keys.g.dart';
import 'package:zcart/views/screens/tabs/account_tab/blogs/blogsDetails_screen.dart';
import 'package:zcart/views/shared_widgets/loading_widget.dart';
import 'package:zcart/Theme/styles/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:velocity_x/velocity_x.dart';

class BlogsScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final blogsState = watch(blogsProvider);
    return Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.blogs.tr()),
          centerTitle: true,
          elevation: 0,
        ),
        body: RefreshIndicator(
          onRefresh: () => context.read(blogsProvider.notifier).blogs(),
          child: blogsState is BlogsLoadedState
              ? blogsState.blogList!.length != 0
                  ? ListView.builder(
                      itemCount: blogsState.blogList!.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 0,
                          child: ListTile(
                            leading: Container(
                              width: 50,
                              child: Image.network(
                                blogsState.blogList![index].featuredImage!,
                                errorBuilder: (BuildContext _, Object error,
                                    StackTrace? stack) {
                                  return Container();
                                },
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(
                              blogsState.blogList![index].title!,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: context.textTheme.subtitle1!.copyWith(
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            isThreeLine: true,
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  blogsState.blogList![index].excerpt!,
                                  style: context.textTheme.subtitle2,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ).pOnly(bottom: 5),
                                Text(
                                  "${LocaleKeys.author.tr()} : ${blogsState.blogList![index].author!.name}",
                                  style: context.textTheme.caption,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          CupertinoIcons.hand_thumbsup,
                                          size: 14,
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text(blogsState.blogList![index].likes
                                            .toString()),
                                      ],
                                    ),
                                    VerticalDivider(
                                      width: 5,
                                      thickness: 2,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          CupertinoIcons.text_bubble,
                                          size: 14,
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text(blogsState
                                            .blogList![index].commentsCount
                                            .toString()),
                                      ],
                                    ),
                                    Expanded(
                                      child: Text(
                                        blogsState.blogList![index].updatedAt!,
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ).pSymmetric(v: 5),
                                    ),
                                  ],
                                ).pOnly(top: 3),
                              ],
                            ).pSymmetric(v: 5),
                          ).onInkTap(() {
                            context
                                .read(blogProvider.notifier)
                                .blog(blogsState.blogList![index].slug);
                            context.nextPage(BlogDetailsScreen());
                          }),
                        ).p(10);
                      })
                  : SingleChildScrollView(
                      child: Container(
                        height: context.screenHeight,
                        width: context.screenWidth,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.info_outline).pOnly(bottom: 10),
                            Text(LocaleKeys.blogs_not_available.tr()),
                          ],
                        ),
                      ),
                    )
              : blogsState is BlogsLoadingState
                  ? LoadingWidget()
                  : Container(),
        ));
  }
}
