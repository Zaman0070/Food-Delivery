import 'package:flutter/material.dart';
import 'package:zcart/lib2/widget/GredianIcon.dart';

import 'CallScreen.dart';
import 'Message.dart';

class OpenMessageScreen extends StatefulWidget {
  final MessageList messageDetail;

  const OpenMessageScreen({key, required this.messageDetail}) : super(key: key);
  @override
  _OpenMessageScreenState createState() => _OpenMessageScreenState();
}

class _OpenMessageScreenState extends State<OpenMessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black87,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 13, right: 10, top: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 22,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        CircleAvatar(
                          radius: 25,
                          backgroundImage:
                              AssetImage(widget.messageDetail.image),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          widget.messageDetail.txt1,
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                letterSpacing: 0.6,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                        ),
                        Expanded(child: SizedBox()),
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CallScreen(
                                    callDetails: widget.messageDetail),
                              ),
                            );
                          },
                          child: GradientIcon(
                            Icons.phone,
                            25,
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
                          width: 5,
                        ),
                        GradientIcon(
                          Icons.search,
                          25,
                          LinearGradient(
                            colors: [
                              Theme.of(context).primaryColor,
                              Color(0xfff78361),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: Theme.of(context)
                      .scaffoldBackgroundColor
                      .withOpacity(0.4),
                  thickness: 2,
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 13, right: 10, bottom: 50),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customeText1(
                              "hiii",
                              "20.01 pm",
                            ),
                            SizedBox(height: 14),
                            customeText2(
                              "hiii",
                              "20.01 pm",
                            ),
                            customeText1(
                              "How Are You ? How was the Day? why are not seen from some days",
                              "20.01 pm",
                            ),
                            SizedBox(height: 14),
                            customeText2(
                              "i m fine ",
                              "20.01 pm",
                            ),
                            SizedBox(height: 14),
                            customeText2(
                              "i m busy in some work",
                              "20.01 pm",
                            ),
                            customeText1(
                              "oky",
                              "20.01 pm",
                            ),
                            SizedBox(height: 14),
                            customeText2(
                              "hum",
                              "20.01 pm",
                            ),
                            customeText1(
                              "say new",
                              "20.01 pm",
                            ),
                            SizedBox(height: 14),
                            customeText2(
                              "nothing",
                              "20.01 pm",
                            ),
                            customeText1(
                              "whats about you",
                              "20.01 pm",
                            ),
                            SizedBox(height: 14),
                            customeText2(
                              "good",
                              "20.01 pm",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 60,
              color: Theme.of(context).backgroundColor,
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 40,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30, bottom: 4),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle:
                              Theme.of(context).textTheme.caption!.copyWith(
                                    letterSpacing: 0.6,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                          hintText: 'Type something here...',
                        ),
                      ),
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  InkWell(
                    onTap: () {},
                    child: GradientIcon(
                      Icons.send,
                      30,
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
                    width: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customeText1(
    String txt1,
    String txt2,
  ) {
    return Padding(
      padding: const EdgeInsets.only(right: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    txt1,
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          letterSpacing: 0.6,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).textTheme.bodyText1!.color,
                        ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 9),
          Text(
            txt2,
            style: Theme.of(context).textTheme.caption!.copyWith(
                  letterSpacing: 0.6,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.white.withOpacity(0.3),
                ),
          )
        ],
      ),
    );
  }

  Widget customeText2(
    String txt1,
    String txt2,
  ) {
    return Padding(
      padding: const EdgeInsets.only(right: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).primaryColor,
                      Color(0xfff78361),
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.0),
                    topLeft: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    txt1,
                    style: Theme.of(context).textTheme.caption!.copyWith(
                        letterSpacing: 0.6,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 9),
          Text(
            txt2,
            style: Theme.of(context).textTheme.caption!.copyWith(
                  letterSpacing: 0.6,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.white.withOpacity(0.3),
                ),
          )
        ],
      ),
    );
  }
}
