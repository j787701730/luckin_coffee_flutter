import 'package:flutter/material.dart';
import 'package:luckin_coffee_flutter/home.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'luckin_coffee_flutter',
      theme: ThemeData(
        primaryColor: Colors.white,
        platform: TargetPlatform.iOS,
        scaffoldBackgroundColor: Colors.white,
        splashColor: Colors.white,
      ),
      home: MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List list = [
    Home(),
    Home(),
    Home(),
    Home(),
    Home(),
  ];
  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);

    return Scaffold(
      body: list[_tabIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 1,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Container(
              width: double.infinity,
              height: 56,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/${_tabIndex == 0 ? 'icon_navigation_home_active' : 'icon_navigation_home_negative'}.png',
                    height: 32,
                  ),
                  Text(
                    '首页',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(14),
                      color: Color(0xff2b4c7e),
                    ),
                  ),
                ],
              ),
            ),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: double.infinity,
              height: 56,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/${_tabIndex == 1 ? 'icon_navigation_drink_active' : 'icon_navigation_drink_negative'}.png',
                    height: 32,
                  ),
                  Text(
                    '菜单',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(14),
                      color: Color(0xff2b4c7e),
                    ),
                  ),
                ],
              ),
            ),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: double.infinity,
              height: 56,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/${_tabIndex == 2 ? 'icon_navigation_order_active' : 'icon_navigation_order_negative'}.png',
                    height: 32,
                  ),
                  Text(
                    '订单',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(14),
                      color: Color(0xff2b4c7e),
                    ),
                  ),
                ],
              ),
            ),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: double.infinity,
              height: 56,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/${_tabIndex == 3 ? 'icon_navigation_shopping_cart_active' : 'icon_navigation_shopping_cart_negative'}.png',
                    height: 32,
                  ),
                  Text(
                    '购物车',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(14),
                      color: Color(0xff2b4c7e),
                    ),
                  ),
                ],
              ),
            ),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: double.infinity,
              height: 56,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/${_tabIndex == 4 ? 'icon_navigation_mine_active' : 'icon_navigation_mine_negative'}.png',
                    height: 32,
                  ),
                  Text(
                    '我的',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(14),
                      color: Color(0xff2b4c7e),
                    ),
                  ),
                ],
              ),
            ),
            title: Text(''),
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _tabIndex,
        onTap: (val) {
          setState(() {
            _tabIndex = val;
          });
        },
      ),
    );
  }
}
