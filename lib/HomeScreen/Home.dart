import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';

import '../ComparePrice/CompareScreen.dart';
import '../ComparePrice/MainCompare.dart';
import '../Garden/News.dart';
import '../Garden/garden.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> imageList = [
    "https://images.unsplash.com/photo-1464297162577-f5295c892194?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
    "https://images.unsplash.com/photo-1536657464919-892534f60d6e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2074&q=80",
    "https://images.unsplash.com/photo-1438274754346-45322cac87e4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2048&q=80",
    "https://images.unsplash.com/photo-1519180392711-496e450edf6a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
    "https://images.unsplash.com/photo-1670768170262-f8606bbcbbac?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2069&q=80",
    "https://images.unsplash.com/photo-1678988764041-7989a86ee351?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2074&q=80",
  ];
  final List<String> imageNews = [
    "https://i.makeagif.com/media/12-03-2017/Bx_HKp.gif",
    "https://nongnghiephuucovn.vn/uploads/tin-tuc/xkns11.jpg",
    "https://congthuong-cdn.mastercms.vn/stores/news_dataimages/2022/122022/16/17/420221216174031.png?rt=20221216175008",
    "https://img.cand.com.vn/resize/800x800/NewFiles/Images/2021/09/22/1519360048news10736_MGNA-1632275748602.jpg",
    "https://vtv1.mediacdn.vn/thumb_w/640/2023/1/13/nong-san-xuat-trung-quoc-1-1673584638583165452091.jpg",
    "https://ngkt.mofa.gov.vn/wp-content/uploads/2020/03/4-1.jpg",
  ];
    final List<String> comparePrice = [
    "https://images.unsplash.com/photo-1695199481826-b7e467746bff?auto=format&fit=crop&q=80&w=1932&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1695892909756-f10b2ca3a093?auto=format&fit=crop&q=80&w=1932&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
  ];
  @override
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
        // homefm3 (2985:1182)
        width: double.infinity,
        height: 942 * fem,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
        ),
        child: Stack(
          children: [
            Positioned(
              // autogroupuk89BDb (MwWtE1NdpnWSDzNBeCUk89)
              left: 0 * fem,
              top: 293 * fem,
              child: Container(
                padding: EdgeInsets.fromLTRB(
                    20 * fem, 30 * fem, 19 * fem, 177 * fem),
                width: 428 * fem,
                height: 949 * fem,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Thông tin khu vườn",
                      style: TextStyle(
                        fontSize: 20, // Điều chỉnh kích thước tiêu đề tùy ý
                        fontWeight:
                            FontWeight.bold, // Điều chỉnh kiểu chữ tùy ý
                      ),
                    ),
                    Container(
                      // autogroupnoihr4q (MwWt8BD1xfSeh6CM27Noih)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 30 * fem),
                      padding: EdgeInsets.fromLTRB(
                          20.5 * fem, 20 * fem, 20.5 * fem, 20 * fem),
                      width: double.infinity,
                      height: 165 * fem,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffebebeb)),
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(10 * fem),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          // Thực hiện chuyển trang khi bấm vào Carousel
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Garden()),
                          );
                        },
                        child: CarouselSlider(
                          options: CarouselOptions(
                            enlargeCenterPage: true,
                            enableInfiniteScroll: false,
                            autoPlay: true,
                            
                          ),
                          items: imageList
                              .map((e) => ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Stack(
                                      fit: StackFit.expand,
                                      children: <Widget>[
                                        Image.network(
                                          e,
                                          width: 1050,
                                          height: 350,
                                          fit: BoxFit.cover,
                                        )
                                      ],
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                    ),
                     Text(
                      "Tin tức nông sản",
                      style: TextStyle(
                        fontSize: 20, // Điều chỉnh kích thước tiêu đề tùy ý
                        fontWeight:
                            FontWeight.bold, // Điều chỉnh kiểu chữ tùy ý
                      ),
                    ),
                    Container(
                      // autogroupnoihr4q (MwWt8BD1xfSeh6CM27Noih)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 30 * fem),
                      padding: EdgeInsets.fromLTRB(
                          20.5 * fem, 20 * fem, 20.5 * fem, 20 * fem),
                      width: double.infinity,
                      height: 165 * fem,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffebebeb)),
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(10 * fem),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          // Thực hiện chuyển trang khi bấm vào Carousel
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => NewsWebView()),
                          );
                        },
                        child: CarouselSlider(
                          options: CarouselOptions(
                            enlargeCenterPage: true,
                            enableInfiniteScroll: false,
                            autoPlay: true,
                            scrollDirection: Axis.horizontal,
                            autoPlayInterval: Duration(seconds: 5)
                          ),
                          items: imageNews
                              .map((e) => ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Stack(
                                      fit: StackFit.expand,
                                      children: <Widget>[
                                        Image.network(
                                          e,
                                          width: 1050,
                                          height: 350,
                                          fit: BoxFit.cover,
                                        )
                                      ],
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                    ),
                    

                     Text(
                      "So sánh giá",
                      style: TextStyle(
                        fontSize: 20, // Điều chỉnh kích thước tiêu đề tùy ý
                        fontWeight:
                            FontWeight.bold, // Điều chỉnh kiểu chữ tùy ý
                      ),
                    ),
                    Container(
                      // autogroupnoihr4q (MwWt8BD1xfSeh6CM27Noih)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 30 * fem),
                      padding: EdgeInsets.fromLTRB(
                          20.5 * fem, 20 * fem, 20.5 * fem, 20 * fem),
                      width: double.infinity,
                      height: 165 * fem,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffebebeb)),
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(10 * fem),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          // Thực hiện chuyển trang khi bấm vào Carousel
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CompareScreen()),
                          );
                        },
                        child: CarouselSlider(
                          options: CarouselOptions(
                            enlargeCenterPage: true,
                            enableInfiniteScroll: false,
                            autoPlay: true,
                            scrollDirection: Axis.horizontal,
                            autoPlayInterval: Duration(seconds: 5)
                          ),
                          items: comparePrice
                              .map((e) => ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Stack(
                                      fit: StackFit.expand,
                                      children: <Widget>[
                                        Image.network(
                                          e,
                                          width: 1050,
                                          height: 350,
                                          fit: BoxFit.cover,
                                        )
                                      ],
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
            Positioned(
              // group245ZdT (2993:2663)
              left: 0 * fem,
              top: 102 * fem,
              child: Container(
                width: 428 * fem,
                height: 191 * fem,
                child: Stack(
                  children: [
                    Positioned(
                      // rectangle51gTB (2970:1156)
                      left: 0 * fem,
                      top: 0 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 428 * fem,
                          height: 121 * fem,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xff6cc51d),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // weekbq3 (2993:2636)
                      left: 19 * fem,
                      top: 66 * fem,
                      child: Container(
                        width: 390 * fem,
                        height: 125 * fem,
                        decoration: BoxDecoration(
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.circular(10 * fem),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x3f000000),
                              offset: Offset(0 * fem, 4 * fem),
                              blurRadius: 2 * fem,
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              // date4id (2993:2639)
                              left: 10 * fem,
                              top: 76 * fem,
                              child: Container(
                                width: 34 * fem,
                                height: 34 * fem,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xff868889)),
                                  color: Color(0xffffffff),
                                  borderRadius: BorderRadius.circular(17 * fem),
                                ),
                                child: Center(
                                  child: Center(
                                    child: Text(
                                      '29',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont(
                                        'Poppins',
                                        fontSize: 20 * ffem,
                                        fontWeight: FontWeight.w600,
                                        height: 1.5 * ffem / fem,
                                        letterSpacing: 0.2 * fem,
                                        color: Color(0xff868889),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              // autogrouphls35Nq (MwWtYuzoExAPuhwkCiHLs3)
                              left: 10 * fem,
                              top: 17 * fem,
                              child: Container(
                                width: 202 * fem,
                                height: 93 * fem,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      // week5ofoctoberbMB (2993:2662)
                                      margin: EdgeInsets.fromLTRB(
                                          0 * fem, 0 * fem, 31 * fem, 32 * fem),
                                      child: Text(
                                        'Week 5 of October',
                                        style: SafeGoogleFont(
                                          'Poppins',
                                          fontSize: 18 * ffem,
                                          fontWeight: FontWeight.w600,
                                          height: 1.5 * ffem / fem,
                                          letterSpacing: 0.18 * fem,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      // autogroup653w4kZ (MwWtfk8kWacNZZTVuL653w)
                                      height: 34 * fem,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            // dateC65 (2993:2640)
                                            width: 34 * fem,
                                            height: double.infinity,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Color(0xff868889)),
                                              color: Color(0xffffffff),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      17 * fem),
                                            ),
                                            child: Center(
                                              child: Center(
                                                child: Text(
                                                  '30',
                                                  textAlign: TextAlign.center,
                                                  style: SafeGoogleFont(
                                                    'Poppins',
                                                    fontSize: 20 * ffem,
                                                    fontWeight: FontWeight.w600,
                                                    height: 1.5 * ffem / fem,
                                                    letterSpacing: 0.2 * fem,
                                                    color: Color(0xff868889),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 22 * fem,
                                          ),
                                          Container(
                                            // datecvV (2993:2643)
                                            width: 34 * fem,
                                            height: double.infinity,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Color(0xff868889)),
                                              color: Color(0xffffffff),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      17 * fem),
                                            ),
                                            child: Center(
                                              child: Center(
                                                child: Text(
                                                  '31',
                                                  textAlign: TextAlign.center,
                                                  style: SafeGoogleFont(
                                                    'Poppins',
                                                    fontSize: 20 * ffem,
                                                    fontWeight: FontWeight.w600,
                                                    height: 1.5 * ffem / fem,
                                                    letterSpacing: 0.2 * fem,
                                                    color: Color(0xff868889),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 22 * fem,
                                          ),
                                          Container(
                                            // date3ku (2993:2646)
                                            width: 34 * fem,
                                            height: double.infinity,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Color(0xff868889)),
                                              color: Color(0xffffffff),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      17 * fem),
                                            ),
                                            child: Center(
                                              child: Center(
                                                child: Text(
                                                  '01',
                                                  textAlign: TextAlign.center,
                                                  style: SafeGoogleFont(
                                                    'Poppins',
                                                    fontSize: 20 * ffem,
                                                    fontWeight: FontWeight.w600,
                                                    height: 1.5 * ffem / fem,
                                                    letterSpacing: 0.2 * fem,
                                                    color: Color(0xff868889),
                                                  ),
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
                            ),
                            Positioned(
                              // dateiMF (2993:2649)
                              left: 234 * fem,
                              top: 76 * fem,
                              child: Container(
                                width: 34 * fem,
                                height: 34 * fem,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xff868889)),
                                  color: Color(0xffffffff),
                                  borderRadius: BorderRadius.circular(17 * fem),
                                ),
                                child: Center(
                                  child: Center(
                                    child: Text(
                                      '02',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont(
                                        'Poppins',
                                        fontSize: 20 * ffem,
                                        fontWeight: FontWeight.w600,
                                        height: 1.5 * ffem / fem,
                                        letterSpacing: 0.2 * fem,
                                        color: Color(0xff868889),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              // date9SZ (2993:2652)
                              left: 290 * fem,
                              top: 76 * fem,
                              child: Container(
                                width: 34 * fem,
                                height: 34 * fem,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xff868889)),
                                  color: Color(0xffffffff),
                                  borderRadius: BorderRadius.circular(17 * fem),
                                ),
                                child: Center(
                                  child: Center(
                                    child: Text(
                                      '03',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont(
                                        'Poppins',
                                        fontSize: 20 * ffem,
                                        fontWeight: FontWeight.w600,
                                        height: 1.5 * ffem / fem,
                                        letterSpacing: 0.2 * fem,
                                        color: Color(0xff868889),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              // datePLu (2993:2655)
                              left: 346 * fem,
                              top: 76 * fem,
                              child: Container(
                                width: 34 * fem,
                                height: 34 * fem,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xff868889)),
                                  color: Color(0xffffffff),
                                  borderRadius: BorderRadius.circular(17 * fem),
                                ),
                                child: Center(
                                  child: Center(
                                    child: Text(
                                      '04',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont(
                                        'Poppins',
                                        fontSize: 20 * ffem,
                                        fontWeight: FontWeight.w600,
                                        height: 1.5 * ffem / fem,
                                        letterSpacing: 0.2 * fem,
                                        color: Color(0xff868889),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      // manageyourgardensdW9 (2993:2633)
                      left: 28 * fem,
                      top: 0 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 226 * fem,
                          height: 30 * fem,
                          child: Text(
                            'Manage your gardens',
                            style: SafeGoogleFont(
                              'Poppins',
                              fontSize: 20 * ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.5 * ffem / fem,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              // topmGu (2985:1203)
              left: 0 * fem,
              top: 0 * fem,
              child: Container(
                padding: EdgeInsets.fromLTRB(
                    18 * fem, 14.87 * fem, 17 * fem, 6.78 * fem),
                width: 428 * fem,
                height: 102 * fem,
                decoration: BoxDecoration(
                  color: Color(0xff6cc51d),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // frame168Ztu (2993:2629)
                      margin: EdgeInsets.fromLTRB(
                          1.72 * fem, 25 * fem, 137.72 * fem, 0 * fem),
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // brocoliH4D (2993:2630)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 5 * fem, 0 * fem),
                            width: 46.56 * fem,
                            height: 49.01 * fem,
                            child: Image.asset(
                              'assets/mobile/images/brocoli.png',
                              width: 46.56 * fem,
                              height: 49.01 * fem,
                            ),
                          ),
                          Container(
                            // skinclinicyhj (2993:2632)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 0 * fem, 0 * fem),
                            child: Text(
                              'Fruit season',
                              style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 32 * ffem,
                                fontWeight: FontWeight.w700,
                                height: 1.5 * ffem / fem,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      )
    );
  }
}
