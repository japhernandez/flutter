import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subTitle;
  final Color colorOne;
  final Color colorTwo;

  const IconHeader({
    Key key,
    @required this.icon,
    @required this.title,
    @required this.subTitle,
    this.colorOne = Colors.blue,
    this.colorTwo = Colors.blueGrey,
  })  : assert(icon != null),
        assert(title != null),
        assert(subTitle != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color colorWhite = Colors.white.withOpacity(0.7);

    return Stack(
      children: <Widget>[
        _IconHeaderBackground(colorOne: this.colorOne, colorTwo: this.colorTwo),
        Positioned(
          top: -50,
          left: -70,
          child: FaIcon(
            this.icon,
            size: 250,
            color: Colors.white.withOpacity(0.2),
          ),
        ),
        Column(
          children: <Widget>[
            SizedBox(height: 80, width: double.infinity),
            Text(this.subTitle,
                style: TextStyle(
                  fontSize: 20,
                  color: colorWhite,
                )),
            SizedBox(height: 20),
            Text(this.title,
                style: TextStyle(
                  fontSize: 25,
                  color: colorWhite,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(height: 20),
            FaIcon(
              this.icon,
              size: 80,
              color: Colors.white,
            ),
          ],
        )
      ],
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {
  final Color colorOne;
  final Color colorTwo;

  const _IconHeaderBackground({
    Key key,
    this.colorOne,
    this.colorTwo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            this.colorOne,
            this.colorTwo,
          ],
        ),
      ),
    );
  }
}
