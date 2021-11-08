import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LiveStream extends StatefulWidget {
  final String name;
  final String profile;
  final String stream;
  final String txt;

  const LiveStream(
      {key,
      required this.name,
      required this.profile,
      required this.stream,
      required this.txt})
      : super(key: key);
  @override
  _LiveStreamState createState() => _LiveStreamState();
}

class _LiveStreamState extends State<LiveStream> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(widget.stream), fit: BoxFit.cover)),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                top: 50,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(widget.profile),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.name,
                            style:
                                Theme.of(context).textTheme.caption!.copyWith(
                                      letterSpacing: 0.6,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            widget.txt,
                            style:
                                Theme.of(context).textTheme.caption!.copyWith(
                                      letterSpacing: 0.6,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white.withOpacity(0.8),
                                    ),
                          ),
                        ],
                      ),
                      Expanded(child: SizedBox()),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.close,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 160,
                  ),
                  Expanded(child: SizedBox()),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 40,
                                width: 200,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Theme.of(context).primaryColor,
                                      Color(0xfff78361),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      FontAwesomeIcons.mars,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Center(
                                      child: Text(
                                        "Share with friends",
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption!
                                            .copyWith(
                                              letterSpacing: 0.6,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 150,
                                child: ListView(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        customeContainer(
                                          "assets/p8.jpg",
                                          "jean wallon",
                                          "Awesome. Loveit",
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        customeContainer(
                                          "assets/p10.jpg",
                                          "Willlie Singome",
                                          "Wow... So pretty!",
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        customeContainer(
                                          "assets/p5.jpg",
                                          "merry Singome",
                                          "Ohh, its look fab",
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        customeContainer(
                                          "assets/p10.jpg",
                                          "Willlie Singome",
                                          "Wow... So pretty!",
                                        ),
                                        SizedBox(
                                          height: 10,
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
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/heart.png"),
                                fit: BoxFit.cover),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 45,
                        width: 280,
                        decoration: BoxDecoration(
                            color: Theme.of(context).canvasColor,
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, bottom: 8),
                          child: TextField(
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(
                                    letterSpacing: 0.6,
                                    fontSize: 15,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .color),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(
                                      letterSpacing: 0.6,
                                      fontSize: 15,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .color),
                              hintText: 'Write a comment...',
                            ),
                          ),
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 43,
                          width: 43,
                          decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: new LinearGradient(
                              colors: [
                                Theme.of(context).primaryColor,
                                Color(0xfff78361),
                              ],
                            ),
                          ),
                          child: Icon(
                            Icons.send,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget customeContainer(
    String img,
    String txt1,
    String txt2,
  ) {
    return Container(
      height: 60,
      width: 235,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Colors.black87),
      child: Padding(
        padding: const EdgeInsets.only(left: 5, top: 5, bottom: 5),
        child: Column(
          children: [
            Row(
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      txt1,
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            letterSpacing: 0.6,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.white.withOpacity(0.4),
                          ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    SizedBox(
                      width: 130,
                      child: Text(
                        txt2,
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              letterSpacing: 0.6,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
