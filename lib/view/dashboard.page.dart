import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {


  @override
  Widget build(BuildContext context) {
    return _showBody();
  }

  Widget _showBody(){
    return Container(
      padding: const EdgeInsets.all(12.0),
      alignment: Alignment.center,
      child: Text(
        'Dashboard Page',
        style: TextStyle(
            fontSize: 18,
        ),
      ),
    );
  }

}
