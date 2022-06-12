import 'package:flutter/material.dart';
import 'package:untitled6/src/Controllers/Config.dart';

class APPBar extends StatefulWidget {
  APPBar({Key? key,required this.onFilterChanged}) : super(key: key);

  ValueChanged<String>? onFilterChanged;
  @override
  State<APPBar> createState() => _APPBarState();
}

class _APPBarState extends State<APPBar> {
  Color color1 = const Color(0xFF0E232E);
  Color color2 = const Color(0xFFF9B700);
  int activeButton = 0;



  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.black87,
    primary: const Color(0xFFF9B700),
    minimumSize: const Size(80, 30),
    padding: const EdgeInsets.all(5),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(100.0),
      child: AppBar(
        flexibleSpace: Row(
          children: [
            Container(
                height: 100,
                alignment: AlignmentDirectional.centerStart,
                padding: EdgeInsets.all(10),
                child: Image.asset("assets/3.png", fit: BoxFit.fill)),
            VerticalDivider(
              color: color2,
              thickness: 2,
              width: 30,
            ),
            Container(alignment: AlignmentDirectional.bottomCenter,padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all((
                            activeButton == 0
                                ? Config.ButtonColor
                                : Config.BarColor)),
                        shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(15)),
                                side: BorderSide(
                                    color: Config.ButtonColor)))),
                    onPressed: () {
                      setState(() {
                        widget.onFilterChanged!('All');
                        activeButton = 0;
                      });
                    },
                    child: Row(
                      children: [
                        Text('All ',style: TextStyle(
                          fontSize: 20
                        ),),
                        Icon(
                          Icons.all_inbox,
                          color:activeButton==0
                              ? Config.BarColor
                              : Config.ButtonColor,
                          size: 20,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all((
                            activeButton == 1
                                ? Config.ButtonColor
                                : Config.BarColor)),
                        shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(15)),
                                side: BorderSide(
                                    color: Config.ButtonColor)))),
                    onPressed: () {
                      setState(() {
                        widget.onFilterChanged!('OverTime');
                        activeButton = 1;
                      });
                    },
                    child: Row(
                      children: [
                        Text('Over Time '),
                        Icon(
                          Icons.timelapse_outlined,
                          color:activeButton==1
                              ? Config.BarColor
                              : Config.ButtonColor,
                          size: 20,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all((
                            activeButton == 2
                                ? Config.ButtonColor
                                : Config.BarColor)),
                        shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(15)),
                                side: BorderSide(
                                    color: Config.ButtonColor)))),
                    onPressed: () {
                      setState(() {
                        widget.onFilterChanged!('Categories');
                        activeButton = 2;
                      });
                    },
                    child: Row(
                      children: [
                        Text('Categories ',style: TextStyle(
                            fontSize: 20
                        ),),
                        Icon(
                          Icons.lunch_dining,
                          color:activeButton==2
                              ? Config.BarColor
                              : Config.ButtonColor,
                          size: 20
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                ],
              ),
            )
          ],
        ),
        backgroundColor: color1,
        actions: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text('Kitchen',
                style: TextStyle(
                    color: Color(0xFFF9B700),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal)),
          )
        ],
      ),
    );
  }
}
