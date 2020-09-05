import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtonOne extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color colorOne;
  final Color colorTwo;
  final Function onPress;

  const ButtonOne({
    Key key,
    this.icon = FontAwesomeIcons.circle,
    @required this.text,
    this.colorOne = Colors.blueAccent,
    this.colorTwo = Colors.blue,
    @required this.onPress,
  })
      : assert(text != null),
        assert(onPress != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: this.onPress,
        child: Stack(
          children: <Widget>[
            _ButtonOneBackground(
                icon: this.icon,
                colorOne: this.colorOne,
                colorTwo: this.colorTwo),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 140,
                  width: 40,
                ),
                FaIcon(
                  this.icon,
                  // FontAwesomeIcons.carCrash,
                  size: 40,
                  color: Colors.white,
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Text(
                    this.text,
                    // 'Motor Accident',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                FaIcon(
                  FontAwesomeIcons.chevronRight,
                  size: 20,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 40,
                )
              ],
            )
          ],
        )
    );
  }
}

class _ButtonOneBackground extends StatelessWidget {
  final IconData icon;
  final Color colorOne;
  final Color colorTwo;

  _ButtonOneBackground({
    Key key,
    this.colorOne,
    this.colorTwo,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: <Widget>[
            Positioned(
              right: -20,
              top: -20,
              child: FaIcon(
                this.icon,
                //FontAwesomeIcons.carCrash,
                size: 150,
                color: Colors.white.withOpacity(0.2),
              ),
            )
          ],
        ),
      ),
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.red,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: Offset(4, 6),
              blurRadius: 10,
            ),
          ],
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(colors: <Color>[
            this.colorOne,
            this.colorTwo
            //Color(0xff6989F5),
            //Color(0xff906EF5),
          ])),
    );
  }
}
