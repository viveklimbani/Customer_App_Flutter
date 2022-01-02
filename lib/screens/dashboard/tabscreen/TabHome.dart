import 'package:carousel_slider/carousel_slider.dart';
import 'package:customer/common/resource/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabHome extends StatefulWidget {
  const TabHome({Key? key}) : super(key: key);

  @override
  _TabHomeState createState() => _TabHomeState();
}

class MyImageView extends StatelessWidget {
  final imgPath;

  MyImageView(this.imgPath);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Image.asset(
        imgPath!,
        fit: BoxFit.cover,
      ),
    );
  }
}

class _TabHomeState extends State<TabHome> {
  int currentPos = 0;
  final List<String> details = [
    "assets/images/ic_header.png",
    "assets/images/ic_header.png",
    "assets/images/ic_header.png",
    "assets/images/ic_header.png",
    "assets/images/ic_header.png",
    "assets/images/ic_header.png",
    "assets/images/ic_header.png",
  ];

  final List<String> listOfImage = [
    "assets/images/ic_header.png",
    "assets/images/ic_header.png",
    "assets/images/ic_header.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getMainLayout,
    );
  }

  get getMainLayout => SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getImageCarousel,
              SizedBox(
                height: 10,
              ),
              getMyCourseRow,
              SizedBox(
                height: 10,
              ),
              getCourseRowList,
              SizedBox(
                height: 10,
              ),
              getFeaturedMyCourseRow,
              SizedBox(
                height: 10,
              ),
              getFeaturedCourseRowList,
            ],
          ),
        ),
      );

  get getImageCarousel => Container(
        child: Stack(children: [
          CarouselSlider.builder(
            itemCount: listOfImage.length,
            options: CarouselOptions(
                autoPlay: true,
                // height: 180.0,
                enlargeCenterPage: true,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentPos = index;
                  });
                }),
            itemBuilder: (context, int index, realIndex) {
              return MyImageView(listOfImage[index]);
            },
          ),
          Positioned.fill(
            top: 165,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: listOfImage.map((url) {
                int index = listOfImage.indexOf(url);
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentPos == index ? Colors.blue : Colors.white,
                  ),
                );
              }).toList(),
            ),
          ),
        ]),
      );

  // get getImageCarousel => Container(
  //       height: 300,
  //       decoration: BoxDecoration(
  //           image: DecorationImage(
  //         image: AssetImage(Images.icHeader),
  //         fit: BoxFit.cover,
  //       )),
  //     );
  get getMyCourseRow => Container(
        child: Padding(
          padding: EdgeInsets.only(top: 8, bottom: 8, right: 10, left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "My Courses",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.blue),
                  ),
                  Text("See what's hot this winter!",
                      style: TextStyle(
                        fontSize: 14,
                      ))
                ],
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  'View All',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  get getCourseRowList => Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        height: MediaQuery.of(context).size.height * 0.235,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: details.length,
            itemBuilder: (context, index) {
              return Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Card(
                  // color: Colors.blue,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(details[index]),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Course Name",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  "1 June 2019 to 6 July 2020",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      );

  get getFeaturedMyCourseRow => Container(
        child: Padding(
          padding: EdgeInsets.only(top: 8, bottom: 8, right: 10, left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Featured Courses",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Colors.blue),
              ),
              Text("Got board? Try something new!",
                  style: TextStyle(
                    fontSize: 14,
                  )),
            ],
          ),
        ),
      );

  get getFeaturedCourseRowList => Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        height: MediaQuery.of(context).size.height * 0.235,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: details.length,
            itemBuilder: (context, index) {
              return Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Card(
                  // color: Colors.blue,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(details[index]),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Course Name",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  "1 June 2019 to 6 July 2020",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      );
}
