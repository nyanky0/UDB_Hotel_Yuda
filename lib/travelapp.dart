import 'package:flutter/material.dart';
import 'package:udb_hotel_yuda/login_page.dart';

import 'package:udb_hotel_yuda/model/apartment.dart';
import 'package:udb_hotel_yuda/detail_page.dart';

class TravelApp extends StatefulWidget {
  const TravelApp({Key? key}) : super(key: key);

  @override
  _TravelAppState createState() => _TravelAppState();
}

class _TravelAppState extends State<TravelApp> {
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    Scaffold(
      backgroundColor: Color(0xFFF6F7FF),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Let's start by adding the text
            Text(
              "Selamat Datang",
              style: TextStyle(
                color: Colors.black,
                fontSize: 26.0,
                fontWeight: FontWeight.w600,
              ),
            ),

            Text(
              "Pilih tujuan anda",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            //Now let's add some elevation to our text field
            //to do this we need to wrap it in a Material widget
            Material(
              elevation: 10.0,
              borderRadius: BorderRadius.circular(30.0),
              shadowColor: Color(0x55434343),
              child: TextField(
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: "Cari hotel...",
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black54,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(),
            RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: Icon(Icons.location_on, size: 16),
                  ),
                  TextSpan(
                    text: " Surakarta",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Jumat, 13 Januari 2023     ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                    ),
                  ),
                  TextSpan(
                    text: "Ubah",
                    style: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontSize: 16.0,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "1 Orang",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Divider(
              color: Colors.black,
            ),
            //Now let's Add a Tabulation bar
            DefaultTabController(
              length: 2,
              child: Expanded(
                child: Column(
                  children: [
                    TabBar(
                      indicatorColor: Colors.lightBlueAccent,
                      unselectedLabelColor: Color(0xFF555555),
                      labelColor: Colors.lightBlueAccent,
                      labelPadding: EdgeInsets.symmetric(horizontal: 8.0),
                      tabs: [
                        Tab(
                          text: "Rating",
                        ),
                        Tab(
                          text: "Terdekat",
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: 400.0,
                      child: TabBarView(
                        children: [
                          //Now let's create our first tab page
                          Column(
                            //mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                'Pilihan Terbaik',
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              SizedBox(
                                height: 200,
                                child: ListView.builder(
                                  itemCount: listApartmentNear.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    Apartment apartment =
                                        listApartmentNear[index];
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailPage(
                                                        apartment: apartment)));
                                      },
                                      child: Container(
                                        width: 300,
                                        margin: EdgeInsets.fromLTRB(
                                          index == 0 ? 16 : 8,
                                          0,
                                          index == listApartmentNear.length - 1
                                              ? 16
                                              : 8,
                                          0,
                                        ),
                                        child: Stack(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                              child: Image.asset(
                                                apartment.image!,
                                                fit: BoxFit.cover,
                                                width: double.maxFinite,
                                              ),
                                            ),
                                            Positioned(
                                              bottom: 0,
                                              right: 0,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.blue[900],
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    bottomRight:
                                                        Radius.circular(16),
                                                    topLeft:
                                                        Radius.circular(16),
                                                  ),
                                                ),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10,
                                                        horizontal: 20),
                                                child: Text(
                                                  '${apartment.title!}',
                                                  //'\$ ${apartment.price!}',
                                                  style: const TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 12.0,
                              ),
                              Text(
                                'Rekomendasi lainnya',
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Expanded(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: 10,
                                  itemBuilder: (ctx, int) {
                                    return Card(
                                      child: ListTile(
                                          title: Text('Hotel $int'),
                                          subtitle: Text('Harga hotel')),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          Column(
                            //mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                'Hotel Terdekat',
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Expanded(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: 10,
                                  itemBuilder: (ctx, int) {
                                    return Card(
                                      child: ListTile(
                                          title: Text('Hotel $int'),
                                          subtitle: Text('Harga hotel')),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ),
    Scaffold(
      backgroundColor: Color(0xFFF6F7FF),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pesanan Saya",
              style: TextStyle(
                color: Colors.black,
                fontSize: 26.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "History pesanan akan ditampilkan disini",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Divider(
              color: Colors.black,
            ),
            Container(
              width: double.infinity,
              height: 94,
              margin: EdgeInsets.symmetric(horizontal: 24),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color(0xffffffff),
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(70),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                      image: DecorationImage(
                        image: AssetImage('alila1.jpg'),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Alila Solo",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xff2A2B3D),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Surakarta, Jawa Tengah",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xffB7B7B7),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    Scaffold(
      backgroundColor: Color(0xFFF6F7FF),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Notifikasi",
              style: TextStyle(
                color: Colors.black,
                fontSize: 26.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Pemberitahuan akan ditampilkan disini",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Divider(
              color: Colors.black,
            ),
            Text(
              "Tidak ada notifikasi baru",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15.0,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    ),
    Scaffold(
      backgroundColor: Color(0xFFF6F7FF),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Profil",
              style: TextStyle(
                color: Colors.black,
                fontSize: 26.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Divider(
              color: Colors.black,
            ),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: .5,
                ),
              ),
              child: Container(
                padding: EdgeInsets.all(70),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage('1.jpg'),
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              color: Colors.grey[300],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                leading: Icon(
                  Icons.person_outline,
                ),
                title: Text(
                  'Yuda Hernawan',
                  //'$usernameP',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              color: Colors.grey[300],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                leading: Icon(
                  Icons.book_outlined,
                ),
                title: Text(
                  'Design Kreatif Aplikasi Mobile',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 10.0),
            //   child: Container(
            //     height: 1.0,
            //     width: 130.0,
            //     color: Colors.black,
            //   ),
            // ),
            // SizedBox(
            //   height: 30,
            // ),
            // Card(
            //   child: ElevatedButton(
            //     onPressed: () {},
            //     child: const Text('Logout'),
            //   ),
            // ),
          ],
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F7FF),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFFF6F7FF),
        title: Row(
            // children: [
            //   IconButton(
            //     onPressed: () {},
            //     icon: Icon(
            //       Icons.menu,
            //       color: Colors.black,
            //     ),
            //   ),
            // ],
            ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      drawer: openDrawer(),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),

      //  : _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.lightBlueAccent,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Pesanan Saya',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifikasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}

class openDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(height: 20),
          // DrawerHeader(
          //   child: Text(
          //     'Side menu',
          //     style: TextStyle(color: Colors.white, fontSize: 25),
          //   ),
          //   //  decoration: BoxDecoration(
          //   //  color: Colors.green,
          //   //  image: DecorationImage(
          //   //  fit: BoxFit.fill,
          //   //image: AssetImage('assets/images/cover.jpg'))),
          // ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Tentang'),
            onTap: () => {showAlertDialog(context)},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Logout berhasil'),
              )),
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              ),
            },
          ),
        ],
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // set up the button
  // Widget okButton = FlatButton(
  //   child: Text("OK"),
  //   onPressed: () {},
  // );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(
      "UAS\nDesign Kreatif Aplikasi Mobile",
      textAlign: TextAlign.center,
    ),
    content: Text(
      "Yuda Hernawan\n190103121\n19TIAK2",
      textAlign: TextAlign.center,
    ),
    // actions: [
    //   okButton,
    // ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

class OnBoardPage extends StatefulWidget {
  const OnBoardPage({Key? key}) : super(key: key);

  @override
  State<OnBoardPage> createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {
  late PageController _pageController;

  int _pageIndex = 0;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [
              0.1,
              0.4,
              0.6,
              0.9,
            ],
            colors: [
              Colors.deepPurpleAccent.shade100,
              Colors.deepPurple.shade300,
              Colors.deepPurple.shade400,
              Colors.deepPurple.shade200,
            ],
          )),
          child: Column(
            children: [
              Expanded(
                  child: PageView.builder(
                      itemCount: demo_data.length,
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          _pageIndex = index;
                        });
                      },
                      itemBuilder: (context, index) => OnBoardContent(
                            image: demo_data[index].image,
                            title: demo_data[index].title,
                            description: demo_data[index].description,
                          ))),
              Row(
                children: [
                  ...List.generate(
                    demo_data.length,
                    (index) => Padding(
                      padding: EdgeInsets.only(right: 4),
                      child: DotIndicator(isActive: index == _pageIndex),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_pageIndex == 2) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TravelApp()),
                          );
                        } else {
                          _pageController.nextPage(
                              curve: Curves.ease,
                              duration: const Duration(milliseconds: 300));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                      ),
                      child: Image.asset(
                        "arrow.png",
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
    this.isActive = false,
  }) : super(key: key);

  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: isActive ? 12 : 4,
      width: 4,
      decoration: BoxDecoration(
        color: isActive
            ? Colors.lightBlueAccent
            : Colors.lightBlueAccent.withOpacity(0.4),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}

class Onboard {
  final String image, title, description;

  Onboard({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<Onboard> demo_data = [
  Onboard(
    image: "assets/11.png",
    title: "Pengalaman menginap yang tak terlupakan",
    description: "Dapatkan liburan terbaik dalam hidup Anda",
  ),
  Onboard(
    image: "assets/12.png",
    title: "Merasa seperti di rumah",
    description: "Ketenangan … yang pantas kamu dapatkan",
  ),
  Onboard(
    image: "assets/13.png",
    title: "Kehadiranmu adalah yang paling berharga",
    description: "Hotel terbaik untuk Anda",
  ),
];

class OnBoardContent extends StatelessWidget {
  const OnBoardContent({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);
  final String image, title, description;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          const Spacer(),
          Image.asset(
            image,
            height: 180,
          ),
          SizedBox(
            height: 250.0,
          ),
          const Spacer(),
          Center(
              child: Column(
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.grey[600],
                ),
              ),
            ],
          )),
          const Spacer(),
        ],
      ),
    ));
  }
}
