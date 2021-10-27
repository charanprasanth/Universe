import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:universe/constants.dart';
import 'package:universe/data.dart';
import 'package:universe/detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gradientEndColor,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [gradientStartColor, gradientEndColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.3, 0.7],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  children: <Widget>[
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Explore",
                        style: TextStyle(
                          fontFamily: 'Avenir',
                          fontSize: 44,
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: DropdownButton(
                        items: const [
                          DropdownMenuItem(
                            child: Text(
                              "Solar System",
                              style: TextStyle(
                                fontFamily: "Avenir",
                                fontSize: 24,
                                color: Color(0x7cdbf1ff),
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                        //onChanged: (value){},
                        icon: Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Image.asset('assets/drop_down_icon.png'),
                        ),
                        underline: const SizedBox(),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 500,
                padding: const EdgeInsets.only(left: 32),
                child: Swiper(
                  itemCount: planets.length,
                  itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                  layout: SwiperLayout.STACK,
                  pagination: const SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                      space: 8,
                      activeSize: 20,
                    ),
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, a, b) => DetailPage(
                              planetInfo: planets[index],
                            ),
                          ),
                        );
                      },
                      child: Stack(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              const SizedBox(height: 100),
                              Card(
                                elevation: 8,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(32.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      const SizedBox(height: 100),
                                      Text(
                                        planets[index].name,
                                        style: const TextStyle(
                                          fontFamily: "Avenir",
                                          fontSize: 44,
                                          color: Color(0xff47455f),
                                          fontWeight: FontWeight.w900,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        "Solar System",
                                        style: TextStyle(
                                          fontFamily: "Avenir",
                                          fontSize: 23,
                                          color: primaryTextColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      const SizedBox(height: 32),
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            "Know More",
                                            style: TextStyle(
                                              fontFamily: "Avenir",
                                              fontSize: 18,
                                              color: secondaryTextColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                          Icon(
                                            Icons.arrow_right,
                                            color: secondaryTextColor,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Hero(
                            tag: planets[index].position,
                            child: Image.asset(planets[index].iconImage),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(36.0),
          ),
          color: Color(0xFF6751B5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
                onPressed: () {}, icon: Image.asset('assets/menu_icon.png')),
            IconButton(
                onPressed: () {}, icon: Image.asset('assets/search_icon.png')),
            IconButton(
                onPressed: () {}, icon: Image.asset('assets/profile_icon.png')),
          ],
        ),
      ),
    );
  }
}
