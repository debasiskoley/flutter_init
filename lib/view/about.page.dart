import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {


  @override
  Widget build(BuildContext context) {
    return _showBody();
  }

  Widget _showBody(){
    return Container(
      padding: const EdgeInsets.all(12.0),
      alignment: Alignment.center,
      child: Text(
        'About Page',
        style: TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }

}
