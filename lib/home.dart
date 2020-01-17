import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 375, height: 667);
    SystemUiOverlayStyle systemUiOverlayStyle =
    SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    return Scaffold(
      body: Column(
        children: <Widget>[
          Text(
            '基础设置',
            style: TextStyle(
              fontSize: ScreenUtil().setSp(16),
            ),
          ),
          Container(
            height: 100,
            width: ScreenUtil().setWidth(330),
            color: Colors.red,
          )
        ],
      ),
    );
  }
}
