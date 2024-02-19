import 'package:flutter/material.dart';

class MentorProfile extends StatelessWidget {
  const MentorProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
      ),
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            "Meenakshy J",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
              color: Color(0xFF514D4D),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Personal Information",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w300,
              color: Color(0xFF514D4D),
            ),
          ),
          SizedBox(
            height: 260,
            width: 400,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 240,
                  width: 320,
                  decoration: BoxDecoration(
                    color: Color(0xFFF3EDF7),
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x26000000),
                        blurRadius: 3,
                        offset: Offset(0, 1),
                        spreadRadius: 1,
                      ),
                      BoxShadow(
                        color: Color(0x4C000000),
                        blurRadius: 2,
                        offset: Offset(0, 1),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 40),
                            child: Text(
                              "Name :",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF514D4D),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20, top: 40),
                            child: Text(
                              "Meenakshy J",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF9C9898),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              "Address :",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF514D4D),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Text(
                              "24 Street, Gandhi\nNagar, Kerala",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF9C9898),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              "Email :",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF514D4D),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Text(
                              "meenu@abc.com",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF9C9898),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              "Phone :",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF514D4D),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Text(
                              "894358XXXX",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF9C9898),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              "Gender :",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF514D4D),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Text(
                              "Female",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF9C9898),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}