import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zcart/lib2/Profile/playVideo.dart';
import 'package:zcart/lib2/Profile/timeline.dart';
import 'package:zcart/lib2/widget/GredianIcon.dart';
import 'package:zcart/riverpod/providers/user_provider.dart';
import 'package:zcart/riverpod/state/user_state.dart';

import 'Images.dart';
import 'editProfile.dart';
import 'music.dart';

class ProfileScreen extends StatefulWidget {
  final AnimationController animationController;

  const ProfileScreen({key, required this.animationController})
      : super(key: key);
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with TickerProviderStateMixin {
  bool icon1 = true;
  bool icon2 = false;
  bool icon3 = false;
  bool icon4 = false;
  late AnimationController _animationController;
  bool isLoadingSliderDetail = false;
  late ScrollController controller;
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
    return Consumer(builder: (context, watch, _) {
      final userState = watch(userNotifierProvider);
      return userState is UserLoadedState
          ? AnimatedBuilder(
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
                      child: Column(
                        children: [
                          Container(
                            height: 220,
                            width: MediaQuery.of(context).size.width,
                            color: Theme.of(context)
                                .scaffoldBackgroundColor
                                .withOpacity(0.2),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 35,
                                ),
                                Row(
                                  children: [
                                    Expanded(child: SizedBox()),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    EditProfileScreen()));
                                      },
                                      child: GradientIcon(
                                        Icons.edit,
                                        24,
                                        LinearGradient(
                                          colors: [
                                            Theme.of(context).primaryColor,
                                            Color(0xfff78361),
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 14, right: 14),
                                  child: Row(
                                    children: [
                                      isLoadingSliderDetail == true
                                          ? Shimmer.fromColors(
                                              baseColor: (Colors.grey[200]!),
                                              highlightColor:
                                                  (Colors.grey[400]!),
                                              enabled: isLoadingSliderDetail,
                                              child: CircleAvatar(
                                                radius: 50,
                                              ),
                                            )
                                          : CircleAvatar(
                                              radius: 50,
                                              backgroundImage: AssetImage(
                                                  "assets/person_placeholder.png"),
                                            ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      isLoadingSliderDetail == true
                                          ? Shimmer.fromColors(
                                              baseColor: (Colors.grey[200]!),
                                              highlightColor:
                                                  (Colors.grey[400]!),
                                              enabled: isLoadingSliderDetail,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: 10,
                                                    width: 150,
                                                    color: Colors.grey[200],
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    height: 10,
                                                    width: 100,
                                                    color: Colors.grey[200],
                                                  ),
                                                ],
                                              ),
                                            )
                                          : Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${userState.user!.name}",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption!
                                                      .copyWith(
                                                        letterSpacing: 0.6,
                                                        fontSize: 23,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                      ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "${userState.user!.email}",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption!
                                                      .copyWith(
                                                        letterSpacing: 0.6,
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white
                                                            .withOpacity(0.4),
                                                      ),
                                                )
                                              ],
                                            ),
                                    ],
                                  ),
                                ),
                                isLoadingSliderDetail == true
                                    ? Shimmer.fromColors(
                                        baseColor: (Colors.grey[200]!),
                                        highlightColor: (Colors.grey[400]!),
                                        enabled: isLoadingSliderDetail,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 25, left: 15, right: 15),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                height: 10,
                                                width: 100,
                                                color: Colors.grey[200],
                                              ),
                                              Container(
                                                height: 10,
                                                width: 100,
                                                color: Colors.grey[200],
                                              ),
                                              Container(
                                                height: 10,
                                                width: 100,
                                                color: Colors.grey[200],
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.only(
                                            top: 25,
                                            left: 15,
                                            right: 15,
                                            bottom: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "128",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption!
                                                      .copyWith(
                                                        letterSpacing: 0.6,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                      ),
                                                ),
                                                SizedBox(width: 4),
                                                Text(
                                                  "Posts",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption!
                                                      .copyWith(
                                                        letterSpacing: 0.6,
                                                        fontSize: 15,
                                                        color: Colors.white
                                                            .withOpacity(0.4),
                                                      ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "31",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption!
                                                      .copyWith(
                                                        letterSpacing: 0.6,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                      ),
                                                ),
                                                SizedBox(width: 4),
                                                Text(
                                                  "Following",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption!
                                                      .copyWith(
                                                        letterSpacing: 0.6,
                                                        fontSize: 15,
                                                        color: Colors.white
                                                            .withOpacity(0.4),
                                                      ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "51",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption!
                                                      .copyWith(
                                                        letterSpacing: 0.6,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                      ),
                                                ),
                                                SizedBox(width: 6),
                                                Text(
                                                  "Following",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption!
                                                      .copyWith(
                                                        letterSpacing: 0.6,
                                                        fontSize: 15,
                                                        color: Colors.white
                                                            .withOpacity(0.4),
                                                      ),
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
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      icon1 = true;
                                      icon2 = false;
                                      icon3 = false;
                                      icon4 = false;
                                    });
                                  },
                                  child: GradientIcon(
                                    FontAwesomeIcons.borderAll,
                                    25,
                                    LinearGradient(
                                      colors: icon1 == true
                                          ? [
                                              Theme.of(context).primaryColor,
                                              Color(0xfff78361),
                                            ]
                                          : [
                                              Colors.white.withOpacity(0.7),
                                              Colors.white.withOpacity(0.7)
                                            ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      icon1 = false;
                                      icon2 = true;
                                      icon3 = false;
                                      icon3 = false;
                                    });
                                  },
                                  child: GradientIcon(
                                    Icons.image,
                                    28,
                                    LinearGradient(
                                      colors: icon2 == true
                                          ? [
                                              Theme.of(context).primaryColor,
                                              Color(0xfff78361),
                                            ]
                                          : [
                                              Colors.white.withOpacity(0.7),
                                              Colors.white.withOpacity(0.7)
                                            ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      icon1 = false;
                                      icon2 = false;
                                      icon3 = true;
                                      icon4 = false;
                                    });
                                  },
                                  child: GradientIcon(
                                    Icons.play_circle_fill,
                                    28,
                                    LinearGradient(
                                      colors: icon3 == true
                                          ? [
                                              Theme.of(context).primaryColor,
                                              Color(0xfff78361),
                                            ]
                                          : [
                                              Colors.white.withOpacity(0.7),
                                              Colors.white.withOpacity(0.7)
                                            ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      icon1 = false;
                                      icon2 = false;
                                      icon3 = false;
                                      icon4 = true;
                                    });
                                  },
                                  child: GradientIcon(
                                    Icons.queue_music,
                                    28,
                                    LinearGradient(
                                      colors: icon4 == true
                                          ? [
                                              Theme.of(context).primaryColor,
                                              Color(0xfff78361),
                                            ]
                                          : [
                                              Colors.white.withOpacity(0.7),
                                              Colors.white.withOpacity(0.7)
                                            ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          icon1 == true
                              ? TimeLineScreen()
                              : icon2 == true
                                  ? ImagesScreen()
                                  : icon3 == true
                                      ? PlayVideoScreen()
                                      : icon4 == true
                                          ? PlayMusicScreen()
                                          : SizedBox(),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          : Container();
    });
  }
}
