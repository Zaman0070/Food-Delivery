import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zcart/lib2/main.dart';

import '../../../main.dart';

class TurnNotificationOnorOff extends StatefulWidget {
  @override
  _TurnNotificationOnorOffState createState() =>
      _TurnNotificationOnorOffState();
}

class _TurnNotificationOnorOffState extends State<TurnNotificationOnorOff> {
  bool notiSwitch = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black87,
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 45,
              ),
              InkWell(
                onTap: () {},
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 34,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 17, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: 90,
                        backgroundColor: Theme.of(context)
                            .scaffoldBackgroundColor
                            .withOpacity(0.2),
                        child: CircleAvatar(
                          radius: 76,
                          backgroundColor: Colors.black87,
                          child: Icon(
                            FontAwesomeIcons.solidBell,
                            color: Colors.white,
                            size: 65,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "Turn on Notifications",
                      style: Theme.of(context).textTheme.caption!.copyWith(
                          letterSpacing: 0.6,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Enable push notifications to let send you personal news and updates",
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            letterSpacing: 0.6,
                            fontSize: 15,
                            color: Colors.white.withOpacity(0.9),
                          ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      height: 70,
                      width: MediaQuery.of(context).size.width / 1.2,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 13,
                          ),
                          Text(
                            "Turn on notifications",
                            style:
                                Theme.of(context).textTheme.caption!.copyWith(
                                      letterSpacing: 0.6,
                                      fontSize: 17,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .color,
                                    ),
                          ),
                          Expanded(child: SizedBox()),
                          CupertinoSwitch(
                            value: notiSwitch,
                            onChanged: (newValue) {
                              setState(
                                () {
                                  notiSwitch = newValue;
                                },
                              );
                            },
                          ),
                          SizedBox(
                            width: 13,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, Routes.HOME);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Next",
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                letterSpacing: 0.6,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          FontAwesomeIcons.fastForward,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
