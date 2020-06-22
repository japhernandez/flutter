import 'package:flutter/material.dart';

class RoundedItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 10.0),
        child: Row(
          children: <Widget>[
            Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Container(
                  height: 110.0,
                  width: 110.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      border: Border.all(color: Colors.yellow, width: 2.0)),
                  child: ClipOval(
                    child: Image.network(
                      'https://www.unotv.com/portal/unotv/imagenes/177817-Principal.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Image.asset('assets/images/logo-2.png', width: 100.0),
              ],
            ),
            SizedBox(width: 10.0)
          ],
        ));
  }
}
