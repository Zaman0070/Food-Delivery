import 'package:flutter/material.dart';
import 'package:zcart/lib2/Profile/otherProfileScreen.dart';

class SearchFriendsScreen extends StatefulWidget {
  @override
  _SearchFriendsScreenState createState() => _SearchFriendsScreenState();
}

class _SearchFriendsScreenState extends State<SearchFriendsScreen> {
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
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Search",
                style: Theme.of(context).textTheme.caption!.copyWith(
                      letterSpacing: 0.6,
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
              ),
              SizedBox(
                height: 23,
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
              Divider(
                color:
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(0.4),
                thickness: 2,
              ),
              SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  "Recent Search",
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        letterSpacing: 0.6,
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                ),
                Text(
                  "Clear all",
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        letterSpacing: 0.6,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                ),
              ]),
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
                          "3 mutual friends",
                          'assets/p8.jpg',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        customRow(
                          "Miranda West",
                          "3 mutual friends",
                          'assets/p2.jpg',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        customRow(
                          "Michael Jones",
                          "3 mutual friends",
                          'assets/p3.jpg',
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        customRow(
                          "Leis Conner",
                          "3 mutual friends",
                          'assets/p4.jpg',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        customRow(
                          "Edith Omen",
                          "3 mutual friends",
                          'assets/p9.jpg',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        customRow(
                          "Stream Kiens",
                          "3 mutual friends",
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
          child: Row(
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
                  height: 30,
                  width: 80,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Theme.of(context).primaryColor,
                        Color(0xfff78361),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      "Follow",
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            letterSpacing: 0.6,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
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
