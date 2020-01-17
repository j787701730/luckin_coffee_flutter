import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List banner = ['banner1.webp', 'banner2.webp', 'banner3.webp'];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 375, height: 667);
    MediaQueryData media = MediaQuery.of(context);
    double width = media.size.width - media.padding.left - media.padding.right;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: width * 416 / 750,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Image.asset(
                  'assets/${banner[index]}',
                  fit: BoxFit.fill,
                );
              },
              itemCount: 3,
              pagination: SwiperCustomPagination(builder: (BuildContext context, SwiperPluginConfig config) {
                return Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.only(
                    bottom: 10,
                  ),
                  child: Wrap(
                    spacing: 10,
                    children: List.generate(config.itemCount, (int index) => index).map<Widget>(
                      (item) {
                        return Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: config.activeIndex == item ? Color(0xff90C0EF) : Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        );
                      },
                    ).toList(),
                  ),
                );
              }),
              autoplay: true,
            ),
          ),
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
