import 'package:flutter/material.dart';
import '../constants.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    print(MediaQuery.of(context).size.height);
    return Container(
      color: kWhiteColor,
      child: Center(
        child: Material(
          elevation: 20,
          child: Container(
            height: 600,
            width: 500,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/StarLogo_consultation_heating.png',width: 250,height: 150,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'MODEL: STAR HEADER 210',
                          style: TextStyle(
                            color: kBlackColor,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'MFG YEAR: 2023',
                          style: TextStyle(
                            color: kBlackColor,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            margin: EdgeInsets.only(right: 30),
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: kGoldenColor,
                              borderRadius: BorderRadius.circular(5)
                            ),
                            child: Icon(
                              Icons.pending_actions,
                              color: Colors.black,
                            )),
                        Text(
                          '© Constellation Heating inc.     ',
                          style: TextStyle(
                            color: kBlackColor,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 30),
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                color: kGoldenColor,
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: Icon(
                              Icons.web,
                              color: Colors.black,
                            )),

                        Text(
                          'www.constellationheating.com',
                          style: TextStyle(
                            color: kBlackColor,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            margin: EdgeInsets.only(right: 30),
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                color: kGoldenColor,
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: Icon(
                              Icons.mail,
                              color: Colors.black,
                            )),
                        Text(
                          'info@constellationheating.com',
                          style: TextStyle(
                            color: kBlackColor,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
