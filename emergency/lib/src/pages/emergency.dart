import 'package:emergency/src/widgets/button_one.dart';
import 'package:emergency/src/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemButton {
  final IconData icon;
  final String text;
  final Color colorOne;
  final Color colorTwo;

  ItemButton(
    this.icon,
    this.text,
    this.colorOne,
    this.colorTwo,
  );
}

class EmergencyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = <ItemButton>[
      new ItemButton(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ItemButton(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new ItemButton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new ItemButton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
      new ItemButton(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ItemButton(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new ItemButton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new ItemButton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
      new ItemButton(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ItemButton(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new ItemButton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new ItemButton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
    ];

    List<Widget> itemMap = items
        .map((item) => ButtonOne(
              icon: item.icon,
              text: item.text,
              colorOne: item.colorOne,
              colorTwo: item.colorTwo,
              onPress: () {
                print('Click!');
              },
            ))
        .toList();

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 200),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                SizedBox(height: 80),
                ...itemMap,
              ],
            ),
          ),
          Stack(
            children: <Widget>[
              IconHeader(
                icon: FontAwesomeIcons.plus,
                title: 'Asistencia Médica',
                subTitle: 'Haz solicitado',
                colorOne: Color(0xff536CF6),
                colorTwo: Color(0xff66A9F2),
              ),
              Positioned(
                top: 45,
                right: 0,
                child: RawMaterialButton(
                  onPressed: (){},
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(15.0),
                  child: FaIcon(FontAwesomeIcons.ellipsisV, color: Colors.white,),
                )
              )
            ],
          ),
        ],
      ),
    );
  }
}

// class IconHeader extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return IconHeader();
//   }
// }
