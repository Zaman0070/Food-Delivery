import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:like_button/like_button.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zcart/lib2/Home/stories.dart';
import 'package:zcart/lib2/Profile/otherProfileScreen.dart';

import 'Comment.dart';
import 'inviteFriends.dart';
import 'latest.dart';
import 'openCamera.dart';

class HomeScreen extends StatefulWidget {
  var animationController;

  HomeScreen({key, this.animationController}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  bool popular = true;
  bool latest = false;
  bool friends = false;
  bool stories = false;
  late AnimationController _animationController;
  late ScrollController controller;
  bool isLoadingSliderDetail = false;
  var sliderImageHieght = 0.0;
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
    sliderImageHieght = MediaQuery.of(context).size.width * 1.3;
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
            child: Scaffold(
              body: ListView(
                padding: EdgeInsets.zero,
                children: [
                  stories
                      ? StoriesScreen(
                          animationController: widget.animationController,
                        )
                      : Container(
                          color: Colors.black87,
                          child: Column(
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).padding.top + 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: Column(
                                  children: [
                                    isLoadingSliderDetail == true
                                        ? Shimmer.fromColors(
                                            baseColor: (Colors.grey[200])!,
                                            highlightColor: (Colors.grey[400])!,
                                            enabled: isLoadingSliderDetail,
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: 45,
                                                  width: 270,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    color: Colors.grey[200],
                                                  ),
                                                ),
                                                Expanded(child: SizedBox()),
                                                Container(
                                                  height: 40,
                                                  width: 40,
                                                  decoration: new BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      20,
                                                    ),
                                                    color: Colors.grey[200],
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        : Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.all(4),
                                                child: Image.asset(
                                                  'assets/images/splash.png',
                                                  height: 80,
                                                  width: 100,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Container(
                                                height: 35,
                                                width: 160,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  color: Theme.of(context)
                                                      .scaffoldBackgroundColor
                                                      .withOpacity(0.3),
                                                ),
                                                child: TextField(
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption!
                                                      .copyWith(
                                                        letterSpacing: 0.6,
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white
                                                            .withOpacity(0.3),
                                                      ),
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    contentPadding:
                                                        EdgeInsets.only(top: 1),
                                                    hintText: "Search",
                                                    hintStyle: Theme.of(context)
                                                        .textTheme
                                                        .caption!
                                                        .copyWith(
                                                          letterSpacing: 0.6,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white
                                                              .withOpacity(0.3),
                                                        ),
                                                    prefixIcon: Icon(
                                                      Icons.search,
                                                      color: Colors.white,
                                                      size: 18,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(child: SizedBox()),
                                              InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              CameraExampleHome()));
                                                },
                                                child: Container(
                                                  height: 35,
                                                  width: 35,
                                                  decoration: new BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
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
                                                    Icons.camera_alt,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      height: 100,
                                      width: MediaQuery.of(context).size.width,
                                      child: ListView(
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        children: [
                                          isLoadingSliderDetail
                                              ? Shimmer.fromColors(
                                                  baseColor:
                                                      (Colors.grey[200])!,
                                                  highlightColor:
                                                      (Colors.grey[400]!),
                                                  enabled:
                                                      isLoadingSliderDetail,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Column(
                                                        children: [
                                                          CircleAvatar(
                                                            radius: 30,
                                                            backgroundColor:
                                                                Colors
                                                                    .grey[200],
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Container(
                                                            height: 10,
                                                            width: 80,
                                                            color: Colors
                                                                .grey[200],
                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      customColumnShimmer(),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      customColumnShimmer(),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      customColumnShimmer(),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      customColumnShimmer(),
                                                    ],
                                                  ),
                                                )
                                              : Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            CameraExampleHome()));
                                                          },
                                                          child: CircleAvatar(
                                                            radius: 30,
                                                            backgroundColor:
                                                                Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .bodyText1!
                                                                    .color,
                                                            child: Icon(
                                                              Icons.add,
                                                              size: 35,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          "Your",
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .caption!
                                                                  .copyWith(
                                                                    letterSpacing:
                                                                        0.6,
                                                                    fontSize:
                                                                        15,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    customeColumn(
                                                      "Marry",
                                                      'assets/p1.jpg',
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    customeColumn(
                                                      "Jack",
                                                      'assets/p8.jpg',
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    customeColumn(
                                                      "Miranda",
                                                      'assets/p2.jpg',
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    customeColumn(
                                                      "Michael",
                                                      'assets/p3.jpg',
                                                    ),
                                                  ],
                                                ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: Container(
                                  height: 40,
                                  child: isLoadingSliderDetail
                                      ? Shimmer.fromColors(
                                          baseColor: (Colors.grey[200]!),
                                          highlightColor: (Colors.grey[400]!),
                                          enabled: isLoadingSliderDetail,
                                          child: ListView(
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            children: [
                                              Container(
                                                height: 40,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                  color: Colors.grey[200],
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Container(
                                                height: 40,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                  color: Colors.grey[200],
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Container(
                                                height: 40,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                  color: Colors.grey[200],
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Container(
                                                height: 40,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                  color: Colors.grey[200],
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : ListView(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  popular = false;

                                                  stories = true;

                                                  latest = false;

                                                  friends = false;
                                                });
                                              },
                                              child: Container(
                                                height: 40,
                                                width: 100,
                                                decoration: stories == true
                                                    ? BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                          colors: [
                                                            Theme.of(context)
                                                                .primaryColor,
                                                            Color(0xfff78361),
                                                          ],
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                      )
                                                    : BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                      ),
                                                child: Center(
                                                  child: Text(
                                                    "Stories",
                                                    style: stories == true
                                                        ? Theme.of(context)
                                                            .textTheme
                                                            .caption!
                                                            .copyWith(
                                                                letterSpacing:
                                                                    0.6,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .white)
                                                        : Theme.of(context)
                                                            .textTheme
                                                            .caption!
                                                            .copyWith(
                                                                letterSpacing:
                                                                    0.6,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  popular = true;
                                                  latest = false;
                                                  stories = false;
                                                  friends = false;
                                                });
                                              },
                                              child: Container(
                                                height: 40,
                                                width: 100,
                                                decoration: popular == true
                                                    ? BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                          colors: [
                                                            Theme.of(context)
                                                                .primaryColor,
                                                            Color(0xfff78361),
                                                          ],
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                      )
                                                    : BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                      ),
                                                child: Center(
                                                  child: Text(
                                                    "Popular",
                                                    style: popular == true
                                                        ? Theme.of(context)
                                                            .textTheme
                                                            .caption!
                                                            .copyWith(
                                                                letterSpacing:
                                                                    0.6,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .white)
                                                        : Theme.of(context)
                                                            .textTheme
                                                            .caption!
                                                            .copyWith(
                                                                letterSpacing:
                                                                    0.6,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  popular = false;

                                                  latest = true;
                                                  stories = false;

                                                  friends = false;
                                                });

                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            LatestScreen()));
                                              },
                                              child: Container(
                                                height: 40,
                                                width: 100,
                                                decoration: latest == true
                                                    ? BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                          colors: [
                                                            Theme.of(context)
                                                                .primaryColor,
                                                            Color(0xfff78361),
                                                          ],
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                      )
                                                    : BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                      ),
                                                child: Center(
                                                  child: Text(
                                                    "Latest",
                                                    style: latest == true
                                                        ? Theme.of(context)
                                                            .textTheme
                                                            .caption!
                                                            .copyWith(
                                                                letterSpacing:
                                                                    0.6,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .white)
                                                        : Theme.of(context)
                                                            .textTheme
                                                            .caption!
                                                            .copyWith(
                                                                letterSpacing:
                                                                    0.6,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  popular = false;
                                                  latest = false;
                                                  stories = false;
                                                  friends = true;
                                                });

                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            InviteFriendsScreen()));
                                              },
                                              child: Container(
                                                height: 40,
                                                width: 100,
                                                decoration: friends == true
                                                    ? BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                          colors: [
                                                            Theme.of(context)
                                                                .primaryColor,
                                                            Color(0xfff78361),
                                                          ],
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                      )
                                                    : BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                      ),
                                                child: Center(
                                                  child: Text(
                                                    "Friends",
                                                    style: friends == true
                                                        ? Theme.of(context)
                                                            .textTheme
                                                            .caption!
                                                            .copyWith(
                                                                letterSpacing:
                                                                    0.6,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .white)
                                                        : Theme.of(context)
                                                            .textTheme
                                                            .caption!
                                                            .copyWith(
                                                                letterSpacing:
                                                                    0.6,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height - 270,
                                child: ListView(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  children: [
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 50, right: 15, left: 15),
                                          child: isLoadingSliderDetail
                                              ? Shimmer.fromColors(
                                                  baseColor:
                                                      (Colors.grey[200]!),
                                                  highlightColor:
                                                      (Colors.grey[400]!),
                                                  enabled:
                                                      isLoadingSliderDetail,
                                                  child: Column(
                                                    children: [
                                                      customeCardShimmer(),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      customeCardShimmer(),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      customeCardShimmer(),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      customeCardShimmer(),
                                                    ],
                                                  ),
                                                )
                                              : Column(
                                                  children: [
                                                    customeCard(
                                                      'assets/p1.jpg',
                                                      "Michael",
                                                      "2 hours ago",
                                                      "#relax, #travel",
                                                      "Coventry is a city with a thousand year of history that has plenty to offer the visiting tourist.located in the heart of warmwickey, which is well-known as shakespeare's country",
                                                      'assets/img1.jpg',
                                                      "5756",
                                                      "45",
                                                      "2",
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    customeCard(
                                                      'assets/p8.jpg',
                                                      "Miranda",
                                                      "2 hours ago",
                                                      "#relax, #travel",
                                                      "Coventry is a city with a thousand year of history that has plenty to offer the visiting tourist.located in the heart of warmwickey, which is well-known as shakespeare's country",
                                                      'assets/login.jpg',
                                                      "5756",
                                                      "45",
                                                      "2",
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    customeCard(
                                                      'assets/p2.jpg',
                                                      "Jack Owen",
                                                      "#relax, #travel",
                                                      "2 hours ago",
                                                      "Coventry is a city with a thousand year of history that has plenty to offer the visiting tourist.located in the heart of warmwickey, which is well-known as shakespeare's country",
                                                      'assets/splash.jpg',
                                                      "5756",
                                                      "45",
                                                      "2",
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    customeCard(
                                                      'assets/p4.jpg',
                                                      "Karly Chan",
                                                      "@michel",
                                                      "#relax, #travel",
                                                      "Coventry is a city with a thousand year of history that has plenty to offer the visiting tourist.located in the heart of warmwickey, which is well-known as shakespeare's country",
                                                      'assets/log.jpg',
                                                      "5756",
                                                      "45",
                                                      "2",
                                                    ),
                                                  ],
                                                ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget customeColumn(
    String txt1,
    String img,
  ) {
    return Column(
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
        SizedBox(
          height: 5,
        ),
        Text(
          txt1,
          style: Theme.of(context).textTheme.caption!.copyWith(
                letterSpacing: 0.6,
                fontSize: 15,
                color: Colors.white,
              ),
        ),
      ],
    );
  }

  Widget customColumnShimmer() {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Theme.of(context).primaryColor,
          child: CircleAvatar(
            radius: 28,
            backgroundColor: Colors.grey[200],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 10,
          width: 50,
          color: Colors.grey[200],
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
    String img2,
    String likes,
    String coment,
    String share,
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
          Container(
            height: 200,
            decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(img2), fit: BoxFit.cover),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OtheProfileScreen(
                            profile: img,
                            name: txt1,
                          ),
                        ),
                      );
                    },
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(img),
                    ),
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
                ],
              ),
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

  Widget customeCardShimmer() {
    return Card(
      elevation: 4,
      clipBehavior: Clip.antiAlias,
      shadowColor: Theme.of(context).textTheme.bodyText1!.color,
      color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.grey[200],
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
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
                ],
              ),
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
                  width: 200,
                  color: Colors.grey[200],
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding:
                const EdgeInsets.only(top: 13, bottom: 16, left: 14, right: 14),
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
                // Expanded(
                //   child: SizedBox(),
                // ),
                // Container(
                //   height: 10,
                //   width: 100,
                //   color: Colors.grey[200],
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
