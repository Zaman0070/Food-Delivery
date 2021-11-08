import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:like_button/like_button.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zcart/lib2/Home/Comment.dart';

class TimeLineScreen extends StatefulWidget {
  @override
  _TimeLineScreenState createState() => _TimeLineScreenState();
}

class _TimeLineScreenState extends State<TimeLineScreen> {
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
                          "#relax, #travel",
                          "Coventry is a city with a thousand year of history that has plenty to offer the visiting tourist.located in the heart of warmwickey, which is well-known as shakespeare's country",
                          "5756",
                          "45",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        customeCard(
                          "2 hours ago",
                          "#relax, #travel",
                          "Coventry is a city with a thousand year of history ",
                          "5756",
                          "45",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        customeCard(
                          "#relax, #travel",
                          "2 hours ago",
                          "India is a city with a thousand year of history that has plenty to offer the visiting tourist.located in the heart of warmwickey, which is well-known as shakespeare's country,this country is so beautiful thas why peopel loved it",
                          "5756",
                          "45",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        customeCard(
                          "@michel",
                          "#relax, #travel",
                          "Coventry is a city with a thousand year of history that has plenty to offer the visiting tourist.located in the heart of warmwickey, which is well-known as shakespeare's country",
                          "5756",
                          "45",
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
    String txt3,
    String txt4,
    String likes,
    String coment,
  ) {
    return Card(
      elevation: 5,
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
                    SizedBox(
                      height: 10,
                    ),
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
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.more_horiz,
                    color: Colors.white.withOpacity(0.4),
                  ),
                ),
                SizedBox(
                  width: 20,
                )
              ],
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  txt3,
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        letterSpacing: 0.6,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                ),
                SizedBox(height: 4),
                Text(
                  txt4,
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        letterSpacing: 0.6,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.5,
                      ),
                ),
              ],
            ),
          ),
          SizedBox(height: 9),
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
                SizedBox(width: 1),
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
                Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 75),
                      child: CircleAvatar(
                        radius: 20,
                        child: CircleAvatar(
                          radius: 18,
                          backgroundImage: AssetImage("assets/p6.jpg"),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: CircleAvatar(
                        radius: 20,
                        child: CircleAvatar(
                          radius: 18,
                          backgroundImage: AssetImage("assets/p2.jpg"),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: CircleAvatar(
                        radius: 20,
                        child: CircleAvatar(
                          radius: 18,
                          backgroundImage: AssetImage("assets/p5.jpg"),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget customeShimerCard() {
    return Card(
      elevation: 5,
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
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Shimmer.fromColors(
              baseColor: (Colors.grey[200]!),
              highlightColor: (Colors.grey[400]!),
              enabled: isLoadingSliderDetail,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 13,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4),
                  Container(
                    height: 13,
                    width: 270,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4),
                  Container(
                    height: 13,
                    width: 260,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 9),
          Padding(
            padding:
                const EdgeInsets.only(top: 13, bottom: 17, left: 15, right: 15),
            child: Shimmer.fromColors(
              baseColor: (Colors.grey[200]!),
              highlightColor: (Colors.grey[400]!),
              enabled: isLoadingSliderDetail,
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
                  Stack(
                    alignment: AlignmentDirectional.bottomStart,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 75),
                        child: CircleAvatar(
                          radius: 20,
                          child: CircleAvatar(
                            radius: 18,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: CircleAvatar(
                          radius: 20,
                          child: CircleAvatar(
                            radius: 18,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: CircleAvatar(
                          radius: 20,
                          child: CircleAvatar(
                            radius: 18,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
