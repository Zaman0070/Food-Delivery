import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:like_button/like_button.dart';
import 'package:zcart/lib2/main.dart';

import '../../../main.dart';

class LatestScreen extends StatefulWidget {
  @override
  _LatestScreenState createState() => _LatestScreenState();
}

class _LatestScreenState extends State<LatestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black87,
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(context, Routes.HOME);
                },
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 45,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Theme.of(context)
                        .scaffoldBackgroundColor
                        .withOpacity(0.2)),
                child: TextField(
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        letterSpacing: 0.6,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white.withOpacity(0.3),
                      ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 13),
                    border: InputBorder.none,
                    hintText: "Search",
                    hintStyle: Theme.of(context).textTheme.caption!.copyWith(
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
                height: 13,
              ),
              Row(
                children: [
                  Text(
                    "What's new ?",
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          letterSpacing: 0.6,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                  ),
                  Expanded(child: SizedBox()),
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('assets/p6.jpg'),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 230,
                          width: MediaQuery.of(context).size.width,
                          child: ListView(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  customeColumn(
                                    "Marry merj",
                                    'assets/img1.jpg',
                                    'assets/p1.jpg',
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  customeColumn(
                                    "Jack owns",
                                    'assets/img7.jpg',
                                    'assets/p2.jpg',
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  customeColumn(
                                    "Miranda detv",
                                    'assets/img3.jpg',
                                    'assets/p4.jpg',
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  customeColumn(
                                    "Michael grt",
                                    'assets/img5.jpg',
                                    'assets/p3.jpg',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Column(
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
                              'assets/p8.jpg',
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
  }

  Widget customeColumn(
    String txt1,
    String img,
    String img2,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(10)),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 23,
              backgroundColor: Theme.of(context).primaryColor,
              child: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(
                  img2,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              txt1,
              style: Theme.of(context).textTheme.caption!.copyWith(
                    letterSpacing: 0.6,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
            ),
          ],
        ),
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
    String share,
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
              ],
            ),
          ),
          Container(
            height: 200,
            decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(img2), fit: BoxFit.cover),
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
}
