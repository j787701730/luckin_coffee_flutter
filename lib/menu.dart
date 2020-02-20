import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List banner = ['menu_banner1.webp', 'menu_banner2.webp'];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 375, height: 667);
    MediaQueryData media = MediaQuery.of(context);
    double width = media.size.width - media.padding.left - media.padding.right;
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: width * 260 / 750,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: Container(
                height: width * 260 / 750,
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return Image.asset(
                      'assets/${banner[index]}',
                      fit: BoxFit.fill,
                    );
                  },
                  itemCount: 2,
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
            ),
          )
        ];
      },
      body: ListView(
        children: <Widget>[
          Container(
            height: width * 260 / 750,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Image.asset(
                  'assets/${banner[index]}',
                  fit: BoxFit.fill,
                );
              },
              itemCount: 2,
              pagination: SwiperCustomPagination(builder: (BuildContext context, SwiperPluginConfig config) {
                return Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.only(
                    bottom: 10,
                  ),
                  child: Wrap(
                    spacing: 10,
                    children: List.generate(config.itemCount, (int index) => index).map<Widget>((item) {
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
                    }).toList(),
                  ),
                );
              }),
              autoplay: true,
            ),
          ),
        ],
      ),
    );
  }
}
