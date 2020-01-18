import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List banner = ['banner1.webp', 'banner2.webp', 'banner3.webp'];
  List menu = [
    {'chName': '现在下单', 'enName': 'ORDER NOW', 'icon': 'icon_order_now_new.png'},
    {'chName': '咖啡钱包', 'enName': 'COFFRR WALLET', 'icon': 'icon_promo_new.png'},
    {'chName': '送Ta咖啡', 'enName': 'SEND COFFEE', 'icon': 'icon_send_coffee_new.png'},
    {'chName': '企业账户', 'enName': 'ENTERPRISE ACCOUNT', 'icon': 'icon_enterprise_new.png'},
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 375, height: 667);
    MediaQueryData media = MediaQuery.of(context);
    double width = media.size.width - media.padding.left - media.padding.right;
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
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
          Container(
            padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(24),
              right: ScreenUtil().setWidth(24),
            ),
            margin: EdgeInsets.only(
              top: ScreenUtil().setHeight(16),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                    bottom: ScreenUtil().setHeight(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '青年汇店',
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(15),
                              color: Color(0xff383838),
                              height: ScreenUtil().setHeight(20 / 15),
                            ),
                          ),
                          Text(
                            '距您53m',
                            style: TextStyle(fontSize: ScreenUtil().setSp(12), color: Color(0xff808080)),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(
                          ScreenUtil().setWidth(2),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                40,
                              ),
                            ),
                            border: Border.all(color: Color(0xff88afd5))),
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: ScreenUtil().setWidth(44),
                              height: ScreenUtil().setHeight(30),
                              alignment: Alignment.center,
                              child: Text(
                                '自提',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xff88afd5),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    40,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: ScreenUtil().setWidth(44),
                              height: ScreenUtil().setHeight(30),
                              alignment: Alignment.center,
                              child: Text(
                                '外送',
                                style: TextStyle(
                                  color: Color(0xff88afd5),
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    40,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: menu.map<Widget>(
                    (item) {
                      return Container(
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: Color(0xfff2f2f2),
                            ),
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: ScreenUtil().setHeight(16),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  item['chName'],
                                  style: TextStyle(
                                    fontSize: ScreenUtil().setSp(16),
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff505050),
                                  ),
                                ),
                                Text(
                                  item['enName'],
                                  style: TextStyle(
                                    fontSize: ScreenUtil().setSp(14),
                                    color: Color(0xff808080),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: ScreenUtil().setHeight(38),
                              height: ScreenUtil().setHeight(38),
                              child: Image.asset('assets/${item['icon']}'),
                            )
                          ],
                        ),
                      );
                    },
                  ).toList(),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(24),
              right: ScreenUtil().setWidth(24),
            ),
            child: Image.asset(
              'assets/bottom_banner.webp',
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }
}
