import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

//import 'dart:js';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Utils {
  //icon mau sac
  static Icon IconWithColor(
    IconData ic,
    Color c,
  ) {
    return Icon(
      ic,
      color: c,
    );
  }
}

class TabMenu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TabMenuState();
}

class _TabMenuState extends State<TabMenu> with SingleTickerProviderStateMixin {
  @override
  late TabController _controller;
  void initState() {
    //khoi tao trang thai
    super.initState();
    _controller = TabController(length: 2, vsync: this);
    _controller.addListener(() {
      TabHandle();
    });
  }

  void TabHandle() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          DefaultTabController(
            length: 2,
            initialIndex: 0,
            child: Column(
              children: [
                TabBar(
                  indicatorColor: Color(4282542002),
                  unselectedLabelColor: Colors.grey,
                  controller: _controller,
                  tabs: [
                    Tab(
                      child: Column(
                        children: [
                          Icon(
                            Icons.cabin_outlined,
                            color: _controller.index == 0
                                ? Color(4282542002)
                                : Colors.grey,
                          ),
                          Text('xep hang'),
                        ],
                      ),
                    ),
                    Tab(
                      child: Column(
                        children: [
                          Utils.IconWithColor(
                            Icons.h_mobiledata,
                            _controller.index == 1
                                ? Color(4282542002)
                                : Colors.grey,
                          ),
                          Text('thanh tich'),
                        ],
                      ),
                    ),
                  ],
                ),
                TabBarView(
                  controller: _controller,
                  children: [
                    Text('data 1'),
                    Text('data 2'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );

    /*    return DefaultTabController(
      length: 6,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              
                ],
              ),
            ],
          ),
          bottom: TabBar(
            indicatorColor: Color(4282542002),
            unselectedLabelColor: Colors.grey,
            controller: _controller,
            tabs: [
              Tab(
                child: Utils.IconWithColor(
                  Icons.home_outlined,
                  _controller.index == 0 ? Color(4282542002) : Colors.grey,
                ),
              ),
              
              Tab(
                child: Utils.IconWithColor(
                  Icons.format_align_justify_outlined,
                  _controller.index == 5 ? Color(4282542002) : Colors.grey,
                ),
              ),
            ],
          ),
        ),
        body: Center(
            child: TabBarView(
          controller: _controller,
          children: [
            NewsFeedTab(),
            Text('data 2'),
            Text('data 3'),
            Text('data 4'),
            Text('data 5'),
            Text('data 6'),
          ],
        )),
      ),
    );
  }
}
*/
  }
}
