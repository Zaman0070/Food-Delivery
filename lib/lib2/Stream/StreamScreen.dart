import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'liveStream.dart';

class StreamScreen extends StatefulWidget {
  final AnimationController animationController;

  const StreamScreen({Key? key, required this.animationController})
      : super(key: key);

  @override
  _StreamScreenState createState() => _StreamScreenState();
}

class _StreamScreenState extends State<StreamScreen>
    with TickerProviderStateMixin {
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
            child: Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.black87,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.zero,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 14, top: 35),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        isLoadingSliderDetail == true
                            ? Shimmer.fromColors(
                                baseColor: (Colors.grey[200]!),
                                highlightColor: (Colors.grey[400]!),
                                enabled: isLoadingSliderDetail,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 10,
                                      width: 100,
                                      color: Colors.grey[200],
                                    ),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Container(
                                      height: 10,
                                      width: 100,
                                      color: Colors.grey[200],
                                    ),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Container(
                                      height: 10,
                                      width: 100,
                                      color: Colors.grey[200],
                                    ),
                                  ],
                                ),
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "For you",
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                            letterSpacing: 0.6,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                  ),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  Text(
                                    "Following",
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                          letterSpacing: 0.6,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white.withOpacity(0.3),
                                        ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  Text(
                                    "Popular",
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                          letterSpacing: 0.6,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white.withOpacity(0.3),
                                        ),
                                  ),
                                ],
                              ),
                        SizedBox(
                          height: 30,
                        ),
                        isLoadingSliderDetail == true
                            ? Shimmer.fromColors(
                                baseColor: (Colors.grey[200]!),
                                highlightColor: (Colors.grey[400]!),
                                enabled: isLoadingSliderDetail,
                                child: Row(
                                  children: [
                                    cusomeStreamShimmer(),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    cusomeStreamShimmer(),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    cusomeStreamShimmer(),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    cusomeStreamShimmer(),
                                  ],
                                ),
                              )
                            : Row(
                                children: [
                                  cusomeStream(
                                    'assets/p4.jpg',
                                    "assets/p3.jpg",
                                    "Devin Stewart",
                                    "01:08:30",
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  cusomeStream(
                                    'assets/img5.jpg',
                                    "assets/p9.jpg",
                                    "Devin Stewart",
                                    "01:08:30",
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  cusomeStream(
                                    'assets/img7.jpg',
                                    "assets/p5.jpg",
                                    "Devin Stewart",
                                    "01:08:30",
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  cusomeStream(
                                    'assets/img3.jpg',
                                    "assets/p8.jpg",
                                    "Devin Stewart",
                                    "01:08:30",
                                  ),
                                ],
                              ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget cusomeStream(
    String img1,
    String img2,
    String txt1,
    String txt2,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LiveStream(
                          name: txt1,
                          txt: txt2,
                          profile: img2,
                          stream: img1,
                        )));
          },
          child: Container(
            height: 350,
            width: 310,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage(img1),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LiveStream(
                              name: txt1,
                              txt: txt2,
                              profile: img2,
                              stream: img1,
                            )));
              },
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(img2),
              ),
            ),
            SizedBox(
              width: 10,
            ),
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

  Widget cusomeStreamShimmer() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 350,
          width: 310,
          color: Colors.grey[200],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey[200],
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 10,
                  width: 150,
                  color: Colors.grey[200],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 10,
                  width: 100,
                  color: Colors.grey[200],
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
