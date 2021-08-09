import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:science_lab/controller/firebaseConst.dart';
import 'package:science_lab/views/Constants/colors.dart';
import 'package:science_lab/views/Constants/textStyles.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white,
                child: Icon(CupertinoIcons.person),
              ),
              Container(
                width: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Loading...",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Container(
                  height: 150,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "No. Questions",
                              style: t15b,
                            ),
                            Icon(
                              Icons.graphic_eq_rounded,
                              color: Colors.white,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "20",
                          style: t80b,
                        )
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        blueGradient1,
                        blueGradient2,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      tileMode: TileMode.decal,
                    ),
                    borderRadius: BorderRadius.circular(13),
                  ),
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Expanded(
                child: Container(
                  height: 150,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "No. Satisfied reply",
                              style: t15b,
                            ),
                            Icon(
                              Icons.graphic_eq_rounded,
                              color: Colors.white,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "20",
                          style: t80b,
                        )
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        deepBlue1,
                        deepBlue2,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      tileMode: TileMode.decal,
                    ),
                    borderRadius: BorderRadius.circular(13),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    MdiIcons.ticketPercent,
                    color: Colors.blueGrey,
                    size: 30,
                  ),
                  SizedBox(width: 5),
                  Text("7")
                ],
              ),
              Container(
                height: 30,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xFF282834)),
                  ),
                  icon: Icon(MdiIcons.ticket),
                  label: Text(
                    "Buy more ticket",
                    style: t15b,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 60,
        ),
        ListTile(
          leading: Icon(
            MdiIcons.messageReplyText,
            color: grayColor,
          ),
          title: Text(
            "Filed Questions",
            style: t13,
          ),
          onTap: () {},
        ),
        SizedBox(
          height: 15,
        ),
        ListTile(
          leading: Icon(
            MdiIcons.timer,
            color: grayColor,
          ),
          title: Text(
            "Pending",
            style: t13,
          ),
          onTap: () {
            print("oj");
          },
        ),
        SizedBox(
          height: 15,
        ),
        ListTile(
          leading: Icon(
            MdiIcons.chatQuestion,
            color: grayColor,
          ),
          title: Text(
            "Chat",
            style: t13,
          ),
          onTap: () {},
        ),
        SizedBox(
          height: 15,
        ),
        ListTile(
          leading: Icon(
            MdiIcons.share,
            color: grayColor,
          ),
          title: Text(
            "Share App",
            style: t13,
          ),
          onTap: () {},
        ),
        SizedBox(
          height: 15,
        ),
        ListTile(
          leading: Icon(
            Icons.logout,
            color: grayColor,
          ),
          title: Text(
            "Log out",
            style: t13,
          ),
          onTap: controller2.signOut,
        ),
        SizedBox(
          height: 15,
        ),
        ListTile(
          leading: Icon(
            MdiIcons.frequentlyAskedQuestions,
            color: grayColor,
          ),
          title: Text(
            "FAQ ",
            style: t13,
          ),
          onTap: () {},
        ),
        SizedBox(
          height: 15,
        ),
        ListTile(
          leading: Icon(
            MdiIcons.information,
            color: grayColor,
          ),
          title: Text(
            "About us",
            style: t13,
          ),
          onTap: () {},
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
