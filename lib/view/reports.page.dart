import 'package:flutter/material.dart';

class ReportPage extends StatefulWidget {
  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {


  @override
  Widget build(BuildContext context) {
    return _showBody();
  }

  Widget _showBody(){
    return Container(
      padding: const EdgeInsets.all(12.0),
      alignment: Alignment.center,
      child: Text(
        'Report Page',
        style: TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }

}
