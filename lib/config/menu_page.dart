import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sms_portal/components/zoom_scaffold.dart';


class MenuScreen extends StatefulWidget {
final Function(String) routerCallback;

const MenuScreen({Key key, this.routerCallback}): super(key: key);

@override
_MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final String imageUrl =
    "https://i.pinimg.com/originals/e9/8e/87/e98e87754466c01d1d8436c5a2e5ceba.jpg";

  var menuItems = [
    {
      'route': 'dashboard',
      'name': 'My Dashboard',
      'icon': Icons.table_chart,
      'isSelected': true
    },
    {
      'route': 'reports',
      'name': 'Reports',
      "icon": Icons.business,
      'isSelected': false
    },
    {
      'route': 'about',
      'name': 'About',
      "icon": Icons.add_comment,
      'isSelected': false
    },
  ];

  var navigationTree = new List<Widget>();

  callback(index, route) {
    widget.routerCallback(route);
    setState(() {
      for(var i = 0; i < menuItems.length; i++){
        if (i == index) {
          menuItems[i]['isSelected'] = true;
        } else {
          menuItems[i]['isSelected'] = false;
        }
      }

      navigationTree.clear();
      _generateMenuButtons();
    });
  }

  _generateMenuButtons() {
    for(var i = 0; i < menuItems.length; i++){
      navigationTree.add(
          new FlatMenuButton(
              icon: menuItems[i]['icon'],
              name: menuItems[i]['name'],
              route: menuItems[i]['route'],
              selected: menuItems[i]['isSelected'],
              callback: callback,
              index: i
          )
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _generateMenuButtons();
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        //on swiping left
        if (details.delta.dx < -6) {
          Provider.of<MenuController>(context, listen: true).toggle();
        }
      },
      child: Container(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * .1,
            left: 32,
            bottom: 8,
            right: MediaQuery.of(context).size.width / 2.9),
        color: Color(0xff3db2c4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 70.0,
                  height: 70.0,
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(imageUrl)
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Text(
                  'WAN SUN KIM',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Manager, OYMA',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                  ),
                )
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .1),
            Column(
              children: navigationTree,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .2),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.settings,
                color: Colors.white,
                size: 20,
              ),
              title: Text('Settings',
                  style: TextStyle(fontSize: 14, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

class FlatMenuButton extends StatefulWidget {
  final IconData icon;
  final String name;
  final String route;
  final bool selected;
  final int index;
  final Function(int, String) callback;

  const FlatMenuButton({Key key, this.icon, this.name, this.route, this.selected, this.index, this.callback}): super(key: key);

  @override
  _FlatMenuButtonState createState() => _FlatMenuButtonState();
}

class _FlatMenuButtonState extends State<FlatMenuButton> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        Provider.of<MenuController>(context, listen: true).toggle();
        setState(() {
          widget.callback(widget.index, widget.route);
        });
      },
      leading:  Icon(
        widget.icon,
        color: Colors.white,
        size: 20,
      ),
      title: Text(
        widget.name,
        style: TextStyle(
            fontSize: 14,
            color: Colors.white
        ),
      ),
    );
  }
}
