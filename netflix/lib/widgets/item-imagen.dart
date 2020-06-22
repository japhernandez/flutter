import 'package:flutter/material.dart';

class ImageItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(width: 10.0),
        Image.network(
          'https://comoacaba.com/wp-content/uploads/2020/06/w58ohFF2YeEEVYRWiiMjJZ1hk9R.jpg',
          width: 100.0,
          fit: BoxFit.cover,
        )
      ],
    );
  }
}
