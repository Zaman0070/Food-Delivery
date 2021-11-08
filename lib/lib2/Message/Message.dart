import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zcart/lib2/Profile/otherProfileScreen.dart';

import 'OpenMessageScreen.dart';

class MessageScreen extends StatefulWidget {
  final AnimationController animationController;

  const MessageScreen({key, required this.animationController})
      : super(key: key);
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen>
    with TickerProviderStateMixin {
  List<MessageList> _messageList = [];
  late AnimationController _animationController;
  late ScrollController controller;
  var sliderImageHieght = 0.0;
  bool isLoadingSliderDetail = false;

  @override
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
    _messageList = [
      MessageList(
        'assets/p3.jpg',
        "Marry Olsen",
        "Thank You So Much",
        "23 Mins",
        "2",
      ),
      MessageList(
        'assets/p1.jpg',
        "Jack Owen",
        "You Know, I've Had Some Beers just Siiting in my fridge",
        "2 Mins",
        "1",
      ),
      MessageList(
        'assets/p2.jpg',
        "Miranda West",
        "Ok, See u then",
        "20 Mins",
        "2",
      ),
      MessageList(
        'assets/p4.jpg',
        "Michael Jones",
        "Are You intersted in  movie? we can go out and have a dinner",
        "1 Mins",
        "2",
      ),
      MessageList(
        'assets/p5.jpg',
        "Cherry Ng",
        "Great! Love it.",
        "20 Mins",
        "4",
      ),
      MessageList(
        'assets/p6.jpg',
        "Karly Chan",
        "Do you want to go out dinner tonight? we can go to the new",
        "23 Mins",
        "2",
      ),
      MessageList(
        'assets/p7.jpg',
        "Janice Ma",
        "Woo... Congrat!",
        "15 Mins",
        "3",
      ),
    ];
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
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 14,
                  right: 10,
                  top: 42,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                isLoadingSliderDetail == true
                                    ? Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          shape: BoxShape.circle,
                                        ),
                                      )
                                    : Icon(
                                        Icons.add,
                                        color: Theme.of(context).primaryColor,
                                        size: 30,
                                      )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Messages",
                              style:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                        letterSpacing: 0.6,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            isLoadingSliderDetail
                                ? Container(
                                    height: 75,
                                    child: Shimmer.fromColors(
                                      baseColor: (Colors.grey[200]!),
                                      highlightColor: (Colors.grey[400]!),
                                      enabled: isLoadingSliderDetail,
                                      child: ListView(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              customeShimerColumn(),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              customeShimerColumn(),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              customeShimerColumn(),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              customeShimerColumn(),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              customeShimerColumn(),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              customeShimerColumn(),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              customeShimerColumn(),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : Container(
                                    height: 75,
                                    child: ListView(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
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
                                            SizedBox(
                                              width: 10,
                                            ),
                                            customeColumn(
                                              "Royel",
                                              'assets/p5.jpg',
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            customeColumn(
                                              "Lizaal",
                                              'assets/p6.jpg',
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            customeColumn(
                                              "Loy",
                                              'assets/p8.jpg',
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
                    isLoadingSliderDetail
                        ? Expanded(
                            flex: 2,
                            child: Container(
                              child: Shimmer.fromColors(
                                  baseColor: (Colors.grey[200]!),
                                  highlightColor: (Colors.grey[400]!),
                                  enabled: isLoadingSliderDetail,
                                  child: ListView(
                                    padding: EdgeInsets.zero,
                                    children: [
                                      Column(
                                        children: [
                                          customShimerRow(),
                                          customShimerRow(),
                                          customShimerRow(),
                                          customShimerRow(),
                                          customShimerRow(),
                                          customShimerRow(),
                                        ],
                                      ),
                                    ],
                                  )),
                            ),
                          )
                        : Expanded(
                            flex: 2,
                            child: Container(
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemCount: _messageList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              OpenMessageScreen(
                                            messageDetail: _messageList[index],
                                          ),
                                        ),
                                      );
                                    },
                                    child: customRow(
                                      _messageList[index].txt1,
                                      _messageList[index].txt2,
                                      _messageList[index].image,
                                      _messageList[index].txt3,
                                      _messageList[index].txt4,
                                    ),
                                  );
                                },
                              ),
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

  Widget customRow(
    String txt1,
    String txt2,
    String img,
    String txt3,
    String txt4,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
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
                radius: 30,
                backgroundImage: AssetImage(img),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    txt1,
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          letterSpacing: 0.6,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  SizedBox(
                    width: 190,
                    child: Text(
                      txt2,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            letterSpacing: 0.6,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SizedBox(),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    txt3,
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          letterSpacing: 0.6,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white.withOpacity(0.5),
                        ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Container(
                    height: 25,
                    width: 25,
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: new LinearGradient(
                        colors: [
                          Theme.of(context).primaryColor,
                          Color(0xfff78361),
                        ],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        txt4,
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              letterSpacing: 0.6,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        SizedBox(
          height: 3,
        ),
        Divider(
          color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.4),
          thickness: 2,
        ),
      ],
    );
  }

  Widget customShimerRow() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 13,
                    width: 160,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 13,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SizedBox(),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 8,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Container(
                    height: 25,
                    width: 25,
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        SizedBox(
          height: 3,
        ),
        Divider(
          color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.4),
          thickness: 2,
        ),
      ],
    );
  }

  Widget customeColumn(
    String txt1,
    String img,
  ) {
    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
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
                radius: 24,
                backgroundImage: AssetImage(
                  img,
                ),
              ),
            ),
            CircleAvatar(
              radius: 8,
              child: CircleAvatar(
                radius: 6,
                backgroundColor: Colors.green,
              ),
            )
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          txt1,
          style: Theme.of(context).textTheme.caption!.copyWith(
                letterSpacing: 0.6,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
        ),
      ],
    );
  }

  Widget customeShimerColumn() {
    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 30,
            ),
            CircleAvatar(
              radius: 8,
              child: CircleAvatar(
                radius: 6,
              ),
            )
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 10,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class MessageList {
  String image;
  String txt1;
  String txt2;
  String txt3;
  String txt4;
  MessageList(
    this.image,
    this.txt1,
    this.txt2,
    this.txt3,
    this.txt4,
  );
}
