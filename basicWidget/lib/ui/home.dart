import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 30.0, left: 10.0),
      color: Colors.deepOrangeAccent,
      child: Column(children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
                child: Text(
              'Margarita',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                  fontSize: 30.0,
                  decoration: TextDecoration.none,
                  fontFamily: 'Oxygen',
                  fontWeight: FontWeight.normal),
            )),
            Expanded(
                child: Text(
              'Tomato, Mozzarella, Basil',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                  fontSize: 20.0,
                  decoration: TextDecoration.none,
                  fontFamily: 'Oxygen',
                  fontWeight: FontWeight.normal),
            )),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
                child: Text(
              'Marinada',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                  fontSize: 30.0,
                  decoration: TextDecoration.none,
                  fontFamily: 'Oxygen',
                  fontWeight: FontWeight.normal),
            )),
            Expanded(
                child: Text(
              'Tomato, Garlic',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                  fontSize: 20.0,
                  decoration: TextDecoration.none,
                  fontFamily: 'Oxygen',
                  fontWeight: FontWeight.normal),
            )),
          ],
        ),
        PizzaImageWidget(),
        OrderButton(),
      ]),
    ));
  }
}

class PizzaImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage pizzaAsset = AssetImage('images/pizza.png');
    Image image = Image(image: pizzaAsset, width: 200.0, height: 200.0);
    return Container(child: image);
  }
}

class OrderButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final button = Container(
        margin: EdgeInsets.only(top: 50.0),
        child: RaisedButton(
          child: Text('Order your Pizza!'),
          color: Colors.lightGreen,
          elevation: 5.0,
          onPressed: () {
            order(context);
          },
        ));
    return button;
  }

  void order(BuildContext context) {
    final alert = AlertDialog(
      title: Text('Order completed'),
      content: Text('Thanks for you order'),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }
}
