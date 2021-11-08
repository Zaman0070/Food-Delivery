import 'package:flutter/material.dart';
import 'package:zcart/views/screens/auth/login_screen.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

enum Notifications { onn, off }
enum Language { english, hindi, gujrati, urdu }

class _SettingScreenState extends State<SettingScreen> {
  Notifications _notifications = Notifications.onn;
  Language _language = Language.english;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black87,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 35, left: 14),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 14, right: 14),
                        child: Text(
                          "Settings",
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                letterSpacing: 0.6,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ExpansionTile(
                        childrenPadding: EdgeInsets.zero,
                        expandedAlignment: Alignment.bottomCenter,
                        trailing:
                            Icon(Icons.arrow_forward_ios, color: Colors.white),
                        title: Text(
                          "Push Notification",
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                letterSpacing: 0.6,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white.withOpacity(0.6),
                              ),
                        ),
                        tilePadding: EdgeInsets.only(left: 30, right: 30),
                        children: [
                          Column(
                            children: <Widget>[
                              ListTile(
                                title: const Text(
                                  'on',
                                  style: TextStyle(color: Colors.white),
                                ),
                                leading: Radio(
                                  value: Notifications.onn,
                                  groupValue: _notifications,
                                  onChanged: (Notifications? value) {
                                    setState(() {
                                      _notifications = value!;
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: const Text(
                                  'off',
                                  style: TextStyle(color: Colors.white),
                                ),
                                leading: Radio(
                                  value: Notifications.off,
                                  groupValue: _notifications,
                                  onChanged: (Notifications? value) {
                                    setState(() {
                                      _notifications = value!;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Divider(
                        color: Theme.of(context)
                            .scaffoldBackgroundColor
                            .withOpacity(0.4),
                        thickness: 2,
                      ),
                      ExpansionTile(
                        childrenPadding: EdgeInsets.zero,
                        trailing:
                            Icon(Icons.arrow_forward_ios, color: Colors.white),
                        title: Text(
                          "Language",
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                letterSpacing: 0.6,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white.withOpacity(0.6),
                              ),
                        ),
                        tilePadding: EdgeInsets.only(left: 30, right: 30),
                        children: [
                          Column(
                            children: <Widget>[
                              ListTile(
                                title: const Text(
                                  'English',
                                  style: TextStyle(color: Colors.white),
                                ),
                                leading: Radio(
                                  value: Language.english,
                                  groupValue: _language,
                                  onChanged: (Language? value) {
                                    setState(() {
                                      _language = value!;
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: const Text(
                                  'Hindi',
                                  style: TextStyle(color: Colors.white),
                                ),
                                leading: Radio(
                                  value: Language.hindi,
                                  groupValue: _language,
                                  onChanged: (Language? value) {
                                    setState(() {
                                      _language = value!;
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: const Text(
                                  'Gujrati',
                                  style: TextStyle(color: Colors.white),
                                ),
                                leading: Radio(
                                  value: Language.gujrati,
                                  groupValue: _language,
                                  onChanged: (Language? value) {
                                    setState(() {
                                      _language = value!;
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: const Text(
                                  'Urdu',
                                  style: TextStyle(color: Colors.white),
                                ),
                                leading: Radio(
                                  value: Language.urdu,
                                  groupValue: _language,
                                  onChanged: (Language? value) {
                                    setState(() {
                                      _language = value!;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Divider(
                        color: Theme.of(context)
                            .scaffoldBackgroundColor
                            .withOpacity(0.4),
                        thickness: 2,
                      ),
                      ExpansionTile(
                        childrenPadding: EdgeInsets.zero,
                        trailing:
                            Icon(Icons.arrow_forward_ios, color: Colors.white),
                        title: Text(
                          "Linked Accounts",
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                letterSpacing: 0.6,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white.withOpacity(0.6),
                              ),
                        ),
                        tilePadding: EdgeInsets.only(left: 30, right: 30),
                        children: [],
                      ),
                      Divider(
                        color: Theme.of(context)
                            .scaffoldBackgroundColor
                            .withOpacity(0.4),
                        thickness: 2,
                      ),
                      ExpansionTile(
                        trailing:
                            Icon(Icons.arrow_forward_ios, color: Colors.white),
                        title: Text(
                          "Block Accounts",
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                letterSpacing: 0.6,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white.withOpacity(0.6),
                              ),
                        ),
                        tilePadding: EdgeInsets.only(left: 30, right: 30),
                        children: [],
                      ),
                      Divider(
                        color: Theme.of(context)
                            .scaffoldBackgroundColor
                            .withOpacity(0.4),
                        thickness: 2,
                      ),
                      ExpansionTile(
                        childrenPadding: EdgeInsets.zero,
                        trailing:
                            Icon(Icons.arrow_forward_ios, color: Colors.white),
                        title: Text(
                          "Search History",
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                letterSpacing: 0.6,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white.withOpacity(0.6),
                              ),
                        ),
                        tilePadding: EdgeInsets.only(left: 30, right: 30),
                        children: [],
                      ),
                      Divider(
                        color: Theme.of(context)
                            .scaffoldBackgroundColor
                            .withOpacity(0.4),
                        thickness: 2,
                      ),
                      ExpansionTile(
                        childrenPadding: EdgeInsets.zero,
                        trailing:
                            Icon(Icons.arrow_forward_ios, color: Colors.white),
                        title: Text(
                          "Report a problem",
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                letterSpacing: 0.6,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white.withOpacity(0.6),
                              ),
                        ),
                        tilePadding: EdgeInsets.only(left: 30, right: 30),
                        children: [],
                      ),
                      Divider(
                        color: Theme.of(context)
                            .scaffoldBackgroundColor
                            .withOpacity(0.4),
                        thickness: 2,
                      ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // InkWell(
                      //   onTap: () {
                      //     Navigator.pushReplacement(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) => LoginScreen()));
                      //   },
                      //   child: Padding(
                      //     padding: const EdgeInsets.only(left: 14, right: 14),
                      //     child: Container(
                      //       height: 50,
                      //       width: MediaQuery.of(context).size.width,
                      //       decoration: BoxDecoration(
                      //           gradient: LinearGradient(
                      //             colors: [
                      //               Theme.of(context).primaryColor,
                      //               Color(0xfff78361),
                      //             ],
                      //           ),
                      //           borderRadius: BorderRadius.circular(30)),
                      //       child: Center(
                      //         child: Text(
                      //           "Logout",
                      //           style: Theme.of(context)
                      //               .textTheme
                      //               .caption!
                      //               .copyWith(
                      //                   letterSpacing: 0.6,
                      //                   fontSize: 20,
                      //                   fontWeight: FontWeight.bold,
                      //                   color: Theme.of(context).canvasColor),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),

                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
