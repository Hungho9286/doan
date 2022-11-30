import 'package:doan/choose_categories.dart';
import 'package:doan/friend_details.dart';
import 'package:doan/screen_chart.dart';
import 'package:doan/user.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:iconsax/iconsax.dart';

class TabProfile extends StatefulWidget {
  const TabProfile({super.key});

  @override
  State<TabProfile> createState() => _TabProfileState();
}

class _TabProfileState extends State<TabProfile>
    with SingleTickerProviderStateMixin {
  List<String> categories = [
    "Công nghệ",
    "Toán học",
    "Văn học",
    "Lịch sử",
    "Địa lí",
    "Đố vui",
  ];
  static User u = new User(
    id: 1,
    name: "Yuna Ogura",
    address: "Japan",
    phoneNumber: "0919345678",
    online: true,
    status: true,
    pointChao: 50,
    pointChallege: 1200,
  );
  var txtName = TextEditingController(text: u.name);
  var txtAddress = TextEditingController(text: u.address);
  var txtphoneNumber = TextEditingController(text: u.phoneNumber);
  Widget personal() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width - 30,
      padding: const EdgeInsets.only(left: 45, right: 45),
      child: ListView(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Text(
                          "Point Chao: ",
                          style: TextStyle(
                            color: Color.fromARGB(255, 140, 169, 44),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          u.pointChao.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(children: [
                      Text(
                        "Point Challege: ",
                        style: TextStyle(
                          color: Color.fromARGB(255, 179, 116, 28),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        u.pointChallege.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ]),
                  )
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width - 60,
                height: 2,
                color: Colors.red,
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          TextField(
            controller: txtName,
            decoration: InputDecoration(label: Text('Họ tên')),
          ),
          SizedBox(
            height: 50,
          ),
          TextField(
            controller: txtAddress,
            decoration: InputDecoration(
              label: Text("Địa chỉ"),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          TextField(
            controller: txtphoneNumber,
            decoration: InputDecoration(
              label: Text("Số điện thoại"),
            ),
          ),
          SizedBox(
            height: 55,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Cập nhật'),
          ),
        ],
      ),
    );
  }

  Widget activity() {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width - 60,
              height: MediaQuery.of(context).size.width - 40,
              child: ListView(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 254, 212, 110),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextButton(
                            onPressed: () {},
                            child: Container(
                              width: 140,
                              height: 100,
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 5,
                                    right: 0,
                                    child: Icon(
                                      Iconsax.chart,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 5,
                                    left: 0,
                                    child: Column(children: [
                                      Container(
                                        width: 140,
                                        margin:
                                            const EdgeInsets.only(bottom: 5),
                                        child: Text(
                                          '70%',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 140,
                                        child: Text(
                                          'Tỉ lệ trả lời đúng',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ]),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 134, 168, 69),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextButton(
                            onPressed: () {},
                            child: Container(
                              width: 140,
                              height: 100,
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 5,
                                    right: 0,
                                    child: Icon(
                                      Iconsax.timer,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 5,
                                    left: 0,
                                    child: Column(children: [
                                      Container(
                                        width: 140,
                                        margin:
                                            const EdgeInsets.only(bottom: 5),
                                        child: Text(
                                          'Kể từ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 140,
                                        child: Text(
                                          'tháng 9 năm 2022',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ]),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 91, 95, 151),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextButton(
                            onPressed: () {},
                            child: Container(
                              width: 140,
                              height: 100,
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 5,
                                    right: 0,
                                    child: Icon(
                                      Iconsax.tick_circle,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 5,
                                    left: 0,
                                    child: Column(children: [
                                      Container(
                                        width: 140,
                                        margin:
                                            const EdgeInsets.only(bottom: 5),
                                        child: Text(
                                          '200',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 140,
                                        child: Text(
                                          'Số câu trả lời đúng',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ]),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 150),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      'HIỆU SUẤT TỪNG LĨNH VỰC',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Iconsax.airdrop,
                      color: Colors.green,
                    ),
                    title: Text(
                      "Công nghệ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text("40 câu được trả lời"),
                  ),
                  ListTile(
                    leading: Icon(
                      Iconsax.math,
                      color: Colors.red,
                    ),
                    title: Text(
                      "Toán học",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text("32 câu được trả lời"),
                  ),
                  ListTile(
                    leading: Icon(
                      Iconsax.book,
                      color: Color.fromARGB(255, 21, 117, 252),
                    ),
                    title: Text(
                      "Văn học",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text("14 câu được trả lời"),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.history,
                      color: Color.fromARGB(255, 189, 35, 250),
                    ),
                    title: Text(
                      "Lịch sử",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text("34 câu được trả lời"),
                  ),
                  ListTile(
                    leading: Icon(
                      Iconsax.routing,
                      color: Color.fromARGB(255, 21, 252, 217),
                    ),
                    title: Text(
                      "Địa lí",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text("27 câu được trả lời"),
                  ),
                  ListTile(
                    leading: Icon(
                      Iconsax.smileys,
                      color: Color.fromARGB(255, 190, 252, 21),
                    ),
                    title: Text(
                      "Đố vui",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text("53 câu được trả lời"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _option() {
    return PopupMenuButton(
        icon: Icon(Icons.more_vert),
        itemBuilder: (context) => [
              PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.person_remove_alt_1_rounded),
                  title: Text('Huỷ kết bạn'),
                  //subtitle: Text('Hủy kết bạn với ...'),
                ),
                onTap: () {},
              ),
              PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.message_outlined),
                  title: Text('Nhắn tin'),
                  //subtitle: Text('chat'),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScreenChat(),
                    ),
                  );
                },
              ),
            ]);
  }

  Widget _friend() {
    return Container(
      padding: EdgeInsets.all(10),
      child: ListView(
        children: [
          Card(
            color: Color.fromARGB(255, 202, 199, 199),
            child: ListTile(
              onTap: () {},
              leading: CircleAvatar(
                radius: 25,
                backgroundColor: Color.fromARGB(255, 8, 59, 101),
                child: CircleAvatar(
                  radius: 23,
                  backgroundImage: AssetImage('images/gaoden.png'),
                ),
              ),
              title: Text(
                'gao đen',
              ),
              trailing: _option(),
            ),
          ),
          Card(
            color: Color.fromARGB(255, 202, 199, 199),
            child: ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundColor: Color.fromARGB(255, 8, 59, 101),
                child: CircleAvatar(
                  radius: 23,
                  backgroundImage: AssetImage('images/trubatgioi.jpg'),
                ),
              ),
              title: Text('trư bát giới'),
              trailing: _option(),
            ),
          ),
          Card(
            color: Color.fromARGB(255, 202, 199, 199),
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FriendDetail(),
                  ),
                );
              },
              leading: CircleAvatar(
                radius: 25,
                backgroundColor: Color.fromARGB(255, 8, 59, 101),
                child: CircleAvatar(
                  radius: 23,
                  backgroundImage: AssetImage('images/frog.jpeg'),
                ),
              ),
              title: Text('frog'),
              trailing: _option(),
            ),
          ),
          Card(
            color: Color.fromARGB(255, 202, 199, 199),
            child: ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundColor: Color.fromARGB(255, 8, 59, 101),
                child: CircleAvatar(
                  radius: 23,
                  backgroundImage: AssetImage('images/khabanh.png'),
                ),
              ),
              title: Text('khá bảnh'),
              trailing: _option(),
            ),
          ),
        ],
      ),
    );
  }

  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      _TabHandle();
    });
  }

  void _TabHandle() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            indicatorColor: Color.fromARGB(255, 250, 194, 64),
            tabs: [
              Tab(
                child: Icon(
                  Iconsax.personalcard,
                  color: _tabController.index == 0
                      ? Color.fromARGB(255, 250, 194, 64)
                      : Colors.grey,
                ),
              ),
              Tab(
                child: Icon(
                  Iconsax.activity,
                  color: _tabController.index == 1
                      ? Color.fromARGB(255, 250, 194, 64)
                      : Colors.grey,
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                personal(),
                activity(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) => ProfileHome();
}

class ProfileHome extends StatefulWidget {
  const ProfileHome({super.key});

  @override
  _ProfileHomeState createState() => _ProfileHomeState();
}

class _ProfileHomeState extends State<ProfileHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Thông tin cá nhân'),
      ),
      body: Center(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'images/backgroundsidemenu.jpg',
                  ),
                ),
              ),
              accountName: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "Yuna Ogura",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text("ID: 1256398"),
                  ],
                ),
              ),
              currentAccountPictureSize: const Size.square(90),
              currentAccountPicture: CircleAvatar(
                radius: 70,
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(
                    'images/avatar.jpg',
                  ),
                ),
              ),
              accountEmail: null,
            ),
            Expanded(
              child: TabProfile(),
            ),
          ],
        ),
      ),
    );
  }
}
