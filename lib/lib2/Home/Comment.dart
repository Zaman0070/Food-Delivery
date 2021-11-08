import 'package:flutter/material.dart';
import 'package:zcart/lib2/Constance/constance.dart';

class CommentScreen extends StatefulWidget {
  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black87,
        child: Padding(
          padding: const EdgeInsets.only(left: 14, right: 14, top: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Comments",
                style: Theme.of(context).textTheme.caption!.copyWith(
                      letterSpacing: 0.6,
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        customRow(
                          "Marry Olsen followed you",
                          "2 hours ago",
                          "if you are an enterprener, you know that your Success cannot depand on tje opnions of others",
                          "Reply",
                          'assets/p1.jpg',
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        customRow(
                          "Marry Olsen react for story 'Killin chillin' to your timeline",
                          "2 hours ago",
                          "if you are an enterprener, you know that your Success cannot depand on tje opnions of others",
                          "Reply",
                          'assets/p2.jpg',
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        customRow(
                          "Jck react for to your timeline",
                          "2 hours ago",
                          "if you are an enterprener, you know that your Success cannot depand on tje opnions of others",
                          "Reply",
                          'assets/p9.jpg',
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        customRow(
                          "Jck react for to your timeline",
                          "2 hours ago",
                          "if you are an enterprener, you know that your Success cannot depand on tje opnions of others",
                          "Reply",
                          'assets/p5.jpg',
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        customRow(
                          "Jck react for to your timeline",
                          "2 hours ago",
                          "if you are an enterprener, you know that your Success cannot depand on tje opnions of others",
                          "Reply",
                          'assets/p7.jpg',
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        customRow(
                          "Jck react for to your timeline",
                          "2 hours ago",
                          "if you are an enterprener, you know that your Success cannot depand on tje opnions of others",
                          "Reply",
                          'assets/p8.jpg',
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget customRow(
    String txt1,
    String txt2,
    String txt3,
    String txt4,
    String img,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(img),
              ),
              SizedBox(
                width: 10,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 230,
                        child: Text(
                          txt1,
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                letterSpacing: 0.6,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      Text(
                        txt2,
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              letterSpacing: 0.6,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.white.withOpacity(0.4),
                            ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 230,
                        child: Text(
                          txt3,
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                letterSpacing: 0.6,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          txt4,
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                letterSpacing: 0.6,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                              ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
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
}
