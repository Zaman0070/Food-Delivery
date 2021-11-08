import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:like_button/like_button.dart';
import 'package:shimmer/shimmer.dart';

import 'Comment.dart';

class StoriesScreen extends StatefulWidget {
  final AnimationController animationController;

  const StoriesScreen({key, required this.animationController})
      : super(key: key);
  @override
  _StoriesScreenState createState() => _StoriesScreenState();
}

class _StoriesScreenState extends State<StoriesScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late ScrollController controller;
  var sliderImageHieght = 0.0;
  bool isLoadingSliderDetail = false;
  void initState() {
    _animationController =
        AnimationController(duration: Duration(milliseconds: 0), vsync: this);
    widget.animationController.forward();
    controller = ScrollController(initialScrollOffset: 0.0);

    controller.addListener(() {
      // ignore: unnecessary_null_comparison
      if (context != null) {
        if (controller.offset < 0) {
          _animationController.animateTo(0.0);
        } else if (controller.offset > 0.0 &&
            controller.offset < sliderImageHieght) {
          if (controller.offset < ((sliderImageHieght / 1.5))) {
            _animationController
                .animateTo((controller.offset / sliderImageHieght));
          } else {
            _animationController
                .animateTo((sliderImageHieght / 1.5) / sliderImageHieght);
          }
        }
      }
    });
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
    return AnimatedBuilder(
      animation: widget.animationController,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: widget.animationController,
          child: new Transform(
            transform: new Matrix4.translationValues(
              0.0,
              40 * (1.0 - widget.animationController.value),
              0.0,
            ),
            child: Container(
              color: Colors.black87,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).padding.top + 10,
                    ),
                    isLoadingSliderDetail == true
                        ? Shimmer.fromColors(
                            baseColor: (Colors.grey[200]!),
                            highlightColor: (Colors.grey[400]!),
                            enabled: isLoadingSliderDetail,
                            child: Row(
                              children: [
                                Container(
                                  height: 10,
                                  width: 100,
                                  color: Colors.grey[200],
                                ),
                                Expanded(
                                  child: SizedBox(),
                                ),
                                Container(
                                  height: 45,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.grey[200],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                )
                              ],
                            ),
                          )
                        : Row(
                            children: [
                              Text(
                                "Stories",
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                      letterSpacing: 0.6,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                              ),
                              Expanded(
                                child: SizedBox(),
                              ),
                              Container(
                                height: 45,
                                width: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor
                                        .withOpacity(0.2)),
                                child: TextField(
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(
                                        letterSpacing: 0.6,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white.withOpacity(0.3),
                                      ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(top: 13),
                                    hintText: "Search",
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                          letterSpacing: 0.6,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white.withOpacity(0.3),
                                        ),
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              )
                            ],
                          ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height - 100,
                      child: ListView(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 80,
                                width: MediaQuery.of(context).size.width,
                                child: ListView(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    isLoadingSliderDetail == true
                                        ? Shimmer.fromColors(
                                            baseColor: (Colors.grey[200]!),
                                            highlightColor: (Colors.grey[400]!),
                                            enabled: isLoadingSliderDetail,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: 55,
                                                  width: 55,
                                                  decoration: new BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    color: Colors.grey[200],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                customeColumnShimmer(),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                customeColumnShimmer(),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                customeColumnShimmer(),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                customeColumnShimmer(),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                customeColumnShimmer(),
                                              ],
                                            ),
                                          )
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              InkWell(
                                                onTap: () {},
                                                child: Container(
                                                  height: 55,
                                                  width: 55,
                                                  decoration: new BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    gradient:
                                                        new LinearGradient(
                                                      colors: [
                                                        Theme.of(context)
                                                            .primaryColor,
                                                        Color(0xfff78361),
                                                      ],
                                                    ),
                                                  ),
                                                  child: Icon(
                                                    FontAwesomeIcons
                                                        .solidPaperPlane,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              customeColumn(
                                                'assets/p1.jpg',
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              customeColumn(
                                                'assets/p8.jpg',
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              customeColumn(
                                                'assets/p2.jpg',
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              customeColumn(
                                                'assets/p3.jpg',
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              customeColumn(
                                                'assets/p8.jpg',
                                              ),
                                            ],
                                          ),
                                  ],
                                ),
                              ),
                              Shimmer.fromColors(
                                baseColor: (Colors.grey[200]!),
                                highlightColor: (Colors.grey[400]!),
                                enabled: isLoadingSliderDetail,
                                child: isLoadingSliderDetail != true
                                    ? Text(
                                        "Events",
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption!
                                            .copyWith(
                                                letterSpacing: 0.6,
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                      )
                                    : Container(
                                        height: 10,
                                        width: 150,
                                        color: Colors.grey[200],
                                      ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 200,
                                child: ListView(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    isLoadingSliderDetail == true
                                        ? Shimmer.fromColors(
                                            baseColor: (Colors.grey[200]!),
                                            highlightColor: (Colors.grey[400]!),
                                            enabled: isLoadingSliderDetail,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                customeEventsShimmer(),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                customeEventsShimmer(),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                customeEventsShimmer(),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                customeEventsShimmer(),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                customeEventsShimmer(),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                customeEventsShimmer(),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                              ],
                                            ),
                                          )
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              customeEvents(
                                                "assets/img1.jpg",
                                                "Happy New Year",
                                                "09:00|Fort Sumter",
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              customeEvents(
                                                "assets/img5.jpg",
                                                "Live-On the Radio",
                                                "10:30|Freedom Trail",
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              customeEvents(
                                                "assets/img3.jpg",
                                                "Happy New Year",
                                                "09:00|Fort Sumter",
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              customeEvents(
                                                "assets/img8.jpg",
                                                "Live-On the Radio",
                                                "10:30|Freedom Trail",
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              customeEvents(
                                                "assets/p8.jpg",
                                                "Happy New Year",
                                                "09:00|Fort Sumter",
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              customeEvents(
                                                "assets/p10.jpg",
                                                "Live-On the Radio",
                                                "10:30|Freedom Trail",
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                            ],
                                          ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              isLoadingSliderDetail == true
                                  ? Shimmer.fromColors(
                                      baseColor: (Colors.grey[200]!),
                                      highlightColor: (Colors.grey[400]!),
                                      enabled: isLoadingSliderDetail,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          customeCardShimmer(),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          customeCardShimmer(),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          customeCard2Shimmer(),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          customeCardShimmer(),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          customeCard2Shimmer(),
                                        ],
                                      ),
                                    )
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        customeCard(
                                          "assets/log.jpg",
                                          "Blanche Hall",
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
                                          "assets/p6.jpg",
                                          "Leeya rezia",
                                          "2 hours ago",
                                          "#relax, #travel",
                                          "Coventry is a city with a thousand year of history ",
                                          "5756",
                                          "45",
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        customeCard2(
                                          'assets/p2.jpg',
                                          "Jack Owen",
                                          "#relax, #travel",
                                          "2 hours ago",
                                          "Coventry is a city with a thousand year of history that has plenty to offer the visiting tourist.located in the heart of warmwickey, which is well-known as shakespeare's country",
                                          'assets/splash.jpg',
                                          "5756",
                                          "45",
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        customeCard(
                                          "assets/log.jpg",
                                          "Blanche Hall",
                                          "#relax, #travel",
                                          "2 hours ago",
                                          "India is a city with a thousand year of history that has plenty to offer the visiting tourist.located in the heart of warmwickey, which is well-known as shakespeare's country,this country is so beautiful thas why peopel loved it",
                                          "5756",
                                          "45",
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        customeCard2(
                                          'assets/p4.jpg',
                                          "Karly Chan",
                                          "@michel",
                                          "#relax, #travel",
                                          "Coventry is a city with a thousand year of history that has plenty to offer the visiting tourist.located in the heart of warmwickey, which is well-known as shakespeare's country",
                                          'assets/log.jpg',
                                          "5756",
                                          "45",
                                        ),
                                      ],
                                    )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget customeColumn(
    String img,
  ) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Theme.of(context).primaryColor,
          child: CircleAvatar(
            radius: 28,
            backgroundImage: AssetImage(
              img,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5, top: 49),
          child: Container(
            width: 50,
            height: 14,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).primaryColor,
                  Color(0xfff78361),
                ],
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.video,
                    size: 10,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Live",
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          letterSpacing: 0.6,
                          fontSize: 6,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget customeColumnShimmer() {
    return Stack(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Theme.of(context).primaryColor,
          child: CircleAvatar(
            radius: 28,
            backgroundColor: Colors.grey[200],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5, top: 49),
          child: Container(
            width: 50,
            height: 14,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        )
      ],
    );
  }

  Widget customeEvents(
    String img,
    String txt1,
    String txt2,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: AssetImage(img),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  txt1,
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        letterSpacing: 0.6,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  txt2,
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        letterSpacing: 0.6,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.white.withOpacity(0.3),
                      ),
                ),
              ],
            )
          ],
        )
      ],
    );
  }

  Widget customeEventsShimmer() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey[200],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 10,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[200],
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Container(
                  height: 10,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[200],
                  ),
                ),
              ],
            )
          ],
        )
      ],
    );
  }

  Widget customeCard(
    String img,
    String txt1,
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
                  backgroundImage: AssetImage(img),
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
                      txt1,
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget customeCardShimmer() {
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
                CircleAvatar(radius: 25, backgroundColor: Colors.grey[200]),
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
                      height: 10,
                      width: 100,
                      color: Colors.grey[200],
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Container(
                      height: 10,
                      width: 100,
                      color: Colors.grey[200],
                    ),
                  ],
                ),
                Expanded(child: SizedBox()),
                Container(
                  height: 10,
                  width: 50,
                  color: Colors.grey[200],
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
                Container(
                  height: 10,
                  width: 100,
                  color: Colors.grey[200],
                ),
                SizedBox(height: 4),
                Container(
                  height: 10,
                  width: 300,
                  color: Colors.grey[200],
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
                Container(
                  height: 10,
                  width: 100,
                  color: Colors.grey[200],
                ),
                SizedBox(width: 25),
                Container(
                  height: 10,
                  width: 100,
                  color: Colors.grey[200],
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
                          backgroundColor: Colors.grey[200],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: CircleAvatar(
                        radius: 20,
                        child: CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.grey[200],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: CircleAvatar(
                        radius: 20,
                        child: CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.grey[200],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget customeCard2(
    String img,
    String txt1,
    String txt2,
    String txt3,
    String txt4,
    String img2,
    String likes,
    String coment,
  ) {
    return Card(
      elevation: 10,
      clipBehavior: Clip.antiAlias,
      shadowColor: Theme.of(context).textTheme.bodyText1!.color,
      color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.3),
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
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(img),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      txt1,
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
                  child: Container(
                    height: 30,
                    width: 80,
                    decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).primaryColor),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        "Follow",
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              letterSpacing: 0.6,
                              fontSize: 15,
                              color: Theme.of(context).primaryColor,
                            ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
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
          Container(
            height: 200,
            decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(img2), fit: BoxFit.cover),
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
                Icon(
                  FontAwesomeIcons.solidCommentDots,
                  color: Colors.white,
                  size: 20,
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

  Widget customeCard2Shimmer() {
    return Card(
      elevation: 10,
      clipBehavior: Clip.antiAlias,
      shadowColor: Theme.of(context).textTheme.bodyText1!.color,
      color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.3),
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
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey[200],
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 10,
                      width: 100,
                      color: Colors.grey[200],
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Container(
                      height: 10,
                      width: 100,
                      color: Colors.grey[200],
                    ),
                  ],
                ),
                Expanded(child: SizedBox()),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 30,
                    width: 80,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: (Colors.grey[200])!,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 10,
                  width: 100,
                  color: Colors.grey[200],
                ),
                SizedBox(height: 4),
                Container(
                  height: 10,
                  width: 300,
                  color: Colors.grey[200],
                ),
              ],
            ),
          ),
          SizedBox(height: 9),
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.grey[200],
            ),
          ),
          SizedBox(height: 9),
          Padding(
            padding:
                const EdgeInsets.only(top: 13, bottom: 17, left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 10,
                  width: 100,
                  color: Colors.grey[200],
                ),
                SizedBox(width: 25),
                Container(
                  height: 10,
                  width: 100,
                  color: Colors.grey[200],
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
                          backgroundColor: Colors.grey[200],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: CircleAvatar(
                        radius: 20,
                        child: CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.grey[200],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: CircleAvatar(
                        radius: 20,
                        child: CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.grey[200],
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
}
