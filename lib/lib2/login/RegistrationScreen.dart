import 'package:flutter/material.dart';
import 'package:zcart/lib2/Notification/TurnOnNotification.dart';
import 'package:zcart/lib2/widget/CustomeButton.dart';
import 'package:zcart/lib2/widget/CustomeTextField.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/register.jpg'),
              fit: BoxFit.cover,
            ),
            color: Theme.of(context).scaffoldBackgroundColor),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 45,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_sharp,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 17, right: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Create an account",
                          style: Theme.of(context).textTheme.caption!.copyWith(
                              letterSpacing: 0.6,
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        CustomeTextField(
                          txt: "UserName",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomeTextField(
                          txt: "Email",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomeTextField(
                          txt: "Phone",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomeTextField(
                          txt: "Date of birth",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomeTextField(
                          txt: "Password",
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        TurnNotificationOnorOff()));
                          },
                          child: CustomeButton(
                            btn: "SING UP",
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24, right: 24),
                          child: Text(
                            "By clicking Sign up you agree to the following Terms and conditions without reservation",
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(
                                    letterSpacing: 0.6,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white.withOpacity(0.4),
                                    height: 1.5),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
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
