import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luckin_coffee_flutter/home.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'localizations.dart';

void main() {
  runApp(MyApp());
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: Colors.transparent,
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'luckin_coffee_flutter',
      theme: ThemeData(
        primaryColor: Colors.white,
//        platform: TargetPlatform.iOS,
        scaffoldBackgroundColor: Colors.white,
        splashColor: Colors.white,
        backgroundColor: Colors.white,
        textTheme: TextTheme(
          subhead: TextStyle(
            textBaseline: TextBaseline.alphabetic,
          ),
          body1: TextStyle(
            color: Colors.black,
          ),
        ),
        primaryColorBrightness: Brightness.dark,
      ),
      home: MyHomePage(title: ''),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        // 自己要补个文件 localizations.dart
        ChineseCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', 'US'),
        Locale('zh', 'CH'),
      ],
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
  DateTime _lastPressedAt; // 上次点击时间

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);

    return WillPopScope(
      onWillPop: () async {
        Fluttertoast.showToast(
          msg: '再按一次退出app',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
        if (_lastPressedAt == null || DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)) {
          // 两次点击间隔超过1秒则重新计时
          _lastPressedAt = DateTime.now();
          return false;
        }
        return true;
      },
      child: Scaffold(
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
      ),
    );
  }
}
