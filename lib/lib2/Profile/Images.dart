import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:like_button/like_button.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zcart/lib2/Home/Comment.dart';

class ImagesScreen extends StatefulWidget {
  @override
  _ImagesScreenState createState() => _ImagesScreenState();
}

class _ImagesScreenState extends State<ImagesScreen> {
  bool isLoadingSliderDetail = false;
  void initState() {
    loadingSliderDetail();
    super.initState();
  }

  loadingSliderDetail() async {
    setState(() {
      isLoadingSliderDetail = true;
    });
    await Future.delayed(const Duration(milliseconds: 700));
    setState(() {
      isLoadingSliderDetail = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoadingSliderDetail
        ? Expanded(
            child: Container(
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15, left: 15),
                    child: Column(
                      children: [
                        customeShimerCard(),
                        SizedBox(
                          height: 10,
                        ),
                        customeShimerCard(),
                        SizedBox(
                          height: 10,
                        ),
                        customeShimerCard(),
                        SizedBox(
                          height: 10,
                        ),
                        customeShimerCard(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        : Expanded(
            child: Container(
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15, left: 15),
                    child: Column(
                      children: [
                        customeCard(
                          "2 hours ago",
                          "assets/img1.jpg",
                          "123",
                          "23",
                          '2',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        customeCard(
                          "2 hours ago",
                          "assets/img8.jpg",
                          "123",
                          "23",
                          '2',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        customeCard(
                          "2 hours ago",
                          "assets/img5.jpg",
                          "123",
                          "23",
                          '2',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  Widget customeCard(
    String txt2,
    String img2,
    String likes,
    String coment,
    String share,
  ) {
    return Card(
      elevation: 10,
      clipBehavior: Clip.antiAlias,
      shadowColor: Theme.of(context).textTheme.bodyText1!.color,
      color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage("assets/log.jpg"),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Blanche Hall",
                      style: Theme.of(context).textTheme.caption!.copyWith(
                          letterSpacing: 0.6,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      txt2,
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            letterSpacing: 0.6,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Colors.white.withOpacity(0.7),
                          ),
                    ),
                  ],
                ),
                Expanded(child: SizedBox()),
                Icon(
                  Icons.more_horiz,
                  color: Colors.white.withOpacity(0.4),
                ),
                SizedBox(
                  width: 20,
                )
              ],
            ),
          ),
          Container(
            height: 230,
            decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(img2), fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 13, bottom: 17, left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LikeButton(
                  circleColor: CircleColor(
                    start: Theme.of(context).primaryColor,
                    end: Color(0xfff78361),
                  ),
                  bubblesColor: BubblesColor(
                    dotPrimaryColor: Theme.of(context).primaryColor,
                    dotSecondaryColor: Color(0xfff78361),
                  ),
                  likeBuilder: (bool isLiked) {
                    return Icon(
                      FontAwesomeIcons.solidHeart,
                      color: isLiked ? Colors.red : Colors.white,
                      size: 20,
                    );
                  },
                ),
                SizedBox(width: 10),
                Text(
                  likes,
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        letterSpacing: 0.6,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                ),
                SizedBox(width: 25),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CommentScreen(),
                      ),
                    );
                  },
                  child: Icon(
                    FontAwesomeIcons.solidCommentDots,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  coment,
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        letterSpacing: 0.6,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                ),
                Expanded(
                  child: SizedBox(),
                ),
                Icon(
                  FontAwesomeIcons.share,
                  color: Colors.white,
                  size: 18,
                ),
                SizedBox(width: 10),
                Text(
                  share,
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        letterSpacing: 0.6,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget customeShimerCard() {
    return Card(
      elevation: 10,
      clipBehavior: Clip.antiAlias,
      shadowColor: Theme.of(context).textTheme.bodyText1!.color,
      color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Shimmer.fromColors(
        baseColor: (Colors.grey[200]!),
        highlightColor: (Colors.grey[400]!),
        enabled: isLoadingSliderDetail,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
              child: Shimmer.fromColors(
                baseColor: (Colors.grey[200]!),
                highlightColor: (Colors.grey[400]!),
                enabled: isLoadingSliderDetail,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 25,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 13,
                          width: 130,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Container(
                          height: 13,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Expanded(child: SizedBox()),
                    Icon(
                      Icons.more_horiz,
                      color: Colors.white.withOpacity(0.4),
                    ),
                    SizedBox(
                      width: 20,
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 230,
              decoration: BoxDecoration(color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 13, bottom: 17, left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    FontAwesomeIcons.solidHeart,
                    color: Colors.white,
                    size: 20,
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 10,
                    width: 37,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 25),
                  Icon(
                    FontAwesomeIcons.solidCommentDots,
                    color: Colors.white,
                    size: 20,
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 10,
                    width: 37,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  Icon(
                    FontAwesomeIcons.share,
                    color: Colors.white,
                    size: 18,
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 10,
                    width: 37,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
