import 'package:flutter/material.dart';
import 'package:zcart/lib2/main.dart';

import '../../../main.dart';
import 'SearchFriend.dart';

class InviteFriendsScreen extends StatefulWidget {
  @override
  _InviteFriendsScreenState createState() => _InviteFriendsScreenState();
}

class _InviteFriendsScreenState extends State<InviteFriendsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black87,
        child: Padding(
          padding: const EdgeInsets.only(left: 14, right: 14, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchFriendsScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Next",
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            letterSpacing: 0.6,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Invite Friends",
                style: Theme.of(context).textTheme.caption!.copyWith(
                      letterSpacing: 0.6,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
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
                        SizedBox(
                          height: 10,
                        ),
                        customRow(
                          "Marry Olsen",
                          "You have friends on Facebook",
                          'assets/p1.jpg',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        customRow(
                          "Jack Owen",
                          "You have friends on Facebook",
                          'assets/p8.jpg',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        customRow2(
                          "Miranda West",
                          "You have friends on Facebook",
                          'assets/p2.jpg',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        customRow(
                          "Michael Jones",
                          "You have friends on Facebook",
                          'assets/p3.jpg',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        customRow2(
                          "Leis Conner",
                          "You have friends on Facebook",
                          'assets/p4.jpg',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        customRow2(
                          "Edith Omen",
                          "You have friends on Facebook",
                          'assets/p9.jpg',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        customRow(
                          "Stream Kiens",
                          "You have friends on Facebook",
                          'assets/p3.jpg',
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
    String img,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(img),
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
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    txt2,
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          letterSpacing: 0.6,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white.withOpacity(0.3),
                        ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SizedBox(),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).primaryColor,
                      Color(0xfff78361),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.check,
                  size: 20,
                  color: Theme.of(context).backgroundColor,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Divider(
          color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.4),
          thickness: 2,
        ),
      ],
    );
  }

  Widget customRow2(
    String txt1,
    String txt2,
    String img,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(img),
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
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    txt2,
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          letterSpacing: 0.6,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white.withOpacity(0.3),
                        ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SizedBox(),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: 25.4,
                width: 26,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).primaryColor, width: 2.4),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.add,
                  size: 22,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Divider(
          color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.4),
          thickness: 2,
        ),
      ],
    );
  }
}
