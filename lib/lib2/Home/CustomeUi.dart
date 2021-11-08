import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zcart/theme.dart';
import 'package:zcart/lib2/Message/Message.dart';
import 'package:zcart/lib2/Notification/Notification.dart';
import 'package:zcart/lib2/Profile/Profile.dart';
import 'package:zcart/lib2/Stream/StreamScreen.dart';
import 'package:zcart/lib2/widget/GredianIcon.dart';

import '../../main.dart';
import 'HomeScreen.dart';

class CustomeUiScreen extends StatefulWidget {
  @override
  _CustomeUiScreenState createState() => _CustomeUiScreenState();
}

class _CustomeUiScreenState extends State<CustomeUiScreen>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Widget indexView;
  // Widget indexView = HomeScreen();
  BottomBarType bottomBarType = BottomBarType.Home;

  @override
  void initState() {
    animationController =
        AnimationController(duration: Duration(milliseconds: 400), vsync: this);
    indexView = HomeScreen(
      animationController: animationController,
    );
    animationController..forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: AppThemeSocail.getTheme().backgroundColor,
        bottomNavigationBar: Container(
            height: 58 + MediaQuery.of(context).padding.bottom,
            child: getBottomBarUI(bottomBarType)),
        body: indexView,
      ),
    );
  }

  void tabClick(BottomBarType tabType) {
    if (tabType != bottomBarType) {
      bottomBarType = tabType;
      animationController.reverse().then((f) {
        if (tabType == BottomBarType.Home) {
          setState(() {
            indexView = HomeScreen(
              animationController: animationController,
            );
          });
        } else if (tabType == BottomBarType.Message) {
          setState(() {
            indexView = MessageScreen(
              animationController: animationController,
            );
          });
        } else if (tabType == BottomBarType.Notification) {
          setState(() {
            indexView = NotificationScreen(
              animationController: animationController,
            );
          });
        } else if (tabType == BottomBarType.Profile) {
          setState(() {
            indexView = ProfileScreen(
              animationController: animationController,
            );
          });
        } else if (tabType == BottomBarType.Straming) {
          setState(() {
            indexView = StreamScreen(
              animationController: animationController,
            );
          });
        }
      });
    }
  }

  Widget getBottomBarUI(BottomBarType tabType) {
    return Container(
      color: HexColor("#20242F"),
      height: MediaQuery.of(context).padding.bottom + 60,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(right: 24, left: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                tabClick(BottomBarType.Home);
              },
              child: GradientIcon(
                FontAwesomeIcons.home,
                20,
                LinearGradient(
                  colors: tabType == BottomBarType.Home
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
                tabClick(BottomBarType.Straming);
              },
              child: GradientIcon(
                Icons.live_tv,
                26,
                LinearGradient(
                  colors: tabType == BottomBarType.Straming
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
                tabClick(BottomBarType.Message);
              },
              child: GradientIcon(
                FontAwesomeIcons.facebookMessenger,
                20,
                LinearGradient(
                  colors: tabType == BottomBarType.Message
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
                tabClick(BottomBarType.Notification);
              },
              child: GradientIcon(
                Icons.notifications_active,
                26,
                LinearGradient(
                  colors: tabType == BottomBarType.Notification
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
                tabClick(BottomBarType.Profile);
              },
              child: GradientIcon(
                FontAwesomeIcons.user,
                20,
                LinearGradient(
                  colors: tabType == BottomBarType.Profile
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
    );
  }
}

enum BottomBarType {
  Home,
  Straming,
  Message,
  Notification,
  Profile,
  Stories,
}
