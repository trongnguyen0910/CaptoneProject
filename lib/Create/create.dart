import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';

import 'create-crop-growth-task.dart';
import 'create-crop-stage.dart';
import 'create-crop.dart';
import 'create-garden-task.dart';
import 'create-garden.dart';
import 'create-plant.dart';
import 'create-season.dart';

class Create extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SingleChildScrollView(
      child: Container(
        // creates84 (3143:2449)
        width: double.infinity,
        height: 1100 * fem,
        decoration: BoxDecoration(
          color: Color(0xfff4f5f9),
        ),
        child: Stack(
          children: [
              Positioned(
              // cropvarietyaoA (3145:2650)
              left: 19 * fem,
              top: 940 * fem,
              child: TextButton(
                onPressed: () {Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateCropGrowthTask()),
                        );},
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child: Container(
                  padding: EdgeInsets.fromLTRB(
                      15 * fem, 37 * fem, 15 * fem, 36 * fem),
                  width: 390 * fem,
                  height: 100 * fem,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5 * fem),
                    color: Color(0x4c000000),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/mobile/images/cropvariety.png',
                      ),
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(
                            0.5), // Điều này làm cho hình ảnh bị mờ và độ sáng giảm đi
                        BlendMode
                            .darken, // Điều này làm cho hình ảnh trở nên tối hơn
                      ),
                    ),
                  ),
                  child: Text(
                    'Crop Variety Growth Task',
                    style: SafeGoogleFont(
                      'Poppins',
                      fontSize: 18 * ffem,
                      fontWeight: FontWeight.w500,
                      height: 1.5 * ffem / fem,
                      letterSpacing: 0.18 * fem,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // cropvarietyaoA (3145:2650)
              left: 19 * fem,
              top: 804 * fem,
              child: TextButton(
                onPressed: () {Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateCropStage()),
                        );},
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child: Container(
                  padding: EdgeInsets.fromLTRB(
                      15 * fem, 37 * fem, 15 * fem, 36 * fem),
                  width: 390 * fem,
                  height: 100 * fem,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5 * fem),
                    color: Color(0x4c000000),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/mobile/images/cropvariety.png',
                      ),
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(
                            0.5), // Điều này làm cho hình ảnh bị mờ và độ sáng giảm đi
                        BlendMode
                            .darken, // Điều này làm cho hình ảnh trở nên tối hơn
                      ),
                    ),
                  ),
                  child: Text(
                    'Crop Variety Stage',
                    style: SafeGoogleFont(
                      'Poppins',
                      fontSize: 18 * ffem,
                      fontWeight: FontWeight.w500,
                      height: 1.5 * ffem / fem,
                      letterSpacing: 0.18 * fem,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // cropvarietyaoA (3145:2650)
              left: 19 * fem,
              top: 668 * fem,
              child: TextButton(
                onPressed: () {Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateCrop()),
                        );},
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child: Container(
                  padding: EdgeInsets.fromLTRB(
                      15 * fem, 37 * fem, 15 * fem, 36 * fem),
                  width: 390 * fem,
                  height: 100 * fem,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5 * fem),
                    color: Color(0x4c000000),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/mobile/images/cropvariety.png',
                      ),
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(
                            0.5), // Điều này làm cho hình ảnh bị mờ và độ sáng giảm đi
                        BlendMode
                            .darken, // Điều này làm cho hình ảnh trở nên tối hơn
                      ),
                    ),
                  ),
                  child: Text(
                    'Crop Variety',
                    style: SafeGoogleFont(
                      'Poppins',
                      fontSize: 18 * ffem,
                      fontWeight: FontWeight.w500,
                      height: 1.5 * ffem / fem,
                      letterSpacing: 0.18 * fem,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // plantZQC (3145:2646)
              left: 19 * fem,
              top: 532 * fem,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreatePlant()),
                        );
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child: Container(
                  padding: EdgeInsets.fromLTRB(
                      15 * fem, 37 * fem, 15 * fem, 36 * fem),
                  width: 390 * fem,
                  height: 100 * fem,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5 * fem),
                    color: Color(0x4c000000),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/mobile/images/plant.png',
                      ),
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(
                            0.5), // Điều này làm cho hình ảnh bị mờ và độ sáng giảm đi
                        BlendMode
                            .darken, // Điều này làm cho hình ảnh trở nên tối hơn
                      ),
                    ),
                  ),
                  child: Text(
                    'Plant',
                    style: SafeGoogleFont(
                      'Poppins',
                      fontSize: 18 * ffem,
                      fontWeight: FontWeight.w500,
                      height: 1.5 * ffem / fem,
                      letterSpacing: 0.18 * fem,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            
            Positioned(
              // taskkUg (3145:2642)
              left: 19 * fem,
              top: 395 * fem,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateGardenTask()),
                        );
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child: Container(
                  padding: EdgeInsets.fromLTRB(
                      15 * fem, 37 * fem, 15 * fem, 36 * fem),
                  width: 390 * fem,
                  height: 100 * fem,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5 * fem),
                    color: Color(0x4c000000),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/mobile/images/gardentask.png',
                      ),
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(
                            0.5), // Điều này làm cho hình ảnh bị mờ và độ sáng giảm đi
                        BlendMode
                            .darken, // Điều này làm cho hình ảnh trở nên tối hơn
                      ),
                    ),
                  ),
                  child: Text(
                    'Garden Task',
                    style: SafeGoogleFont(
                      'Poppins',
                      fontSize: 18 * ffem,
                      fontWeight: FontWeight.w500,
                      height: 1.5 * ffem / fem,
                      letterSpacing: 0.18 * fem,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // gardenkd6 (3145:2637)
              left: 19 * fem,
              top: 259 * fem,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateGarden()),
                        );
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child: Container(
                  padding: EdgeInsets.fromLTRB(
                      15 * fem, 37 * fem, 15 * fem, 36 * fem),
                  width: 390 * fem,
                  height: 100 * fem,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5 * fem),
                    color: Color(0x4c000000),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/mobile/images/garden.png',
                      ),
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(
                            0.5), // Điều này làm cho hình ảnh bị mờ và độ sáng giảm đi
                        BlendMode
                            .darken, // Điều này làm cho hình ảnh trở nên tối hơn
                      ),
                    ),
                  ),
                  child: Text(
                    'Garden',
                    style: SafeGoogleFont(
                      'Poppins',
                      fontSize: 18 * ffem,
                      fontWeight: FontWeight.w500,
                      height: 1.5 * ffem / fem,
                      letterSpacing: 0.18 * fem,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // seasonPAG (3145:2638)
              left: 19 * fem,
              top: 124 * fem,
              child: TextButton(
                onPressed: () {
                   Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateSeason()),
                        );
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child: Container(
                  padding: EdgeInsets.fromLTRB(
                      15 * fem, 37 * fem, 15 * fem, 36 * fem),
                  width: 390 * fem,
                  height: 100 * fem,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5 * fem),
                    color: Color(0x4c000000),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/mobile/images/season.jpg',
                      ),
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(
                            0.5), // Điều này làm cho hình ảnh bị mờ và độ sáng giảm đi
                        BlendMode
                            .darken, // Điều này làm cho hình ảnh trở nên tối hơn
                      ),
                    ),
                  ),
                  child: Text(
                    'Season',
                    style: SafeGoogleFont(
                      'Poppins',
                      fontSize: 18 * ffem,
                      fontWeight: FontWeight.w500,
                      height: 1.5 * ffem / fem,
                      letterSpacing: 0.18 * fem,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // titlebar4xY (3143:2464)
              left: 0 * fem,
              top: 0 * fem,
              child: Container(
                padding: EdgeInsets.fromLTRB(
                    16.77 * fem, 65.11 * fem, 170.48 * fem, 29.84 * fem),
                width: 428 * fem,
                height: 121.95 * fem,
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // backarrowuCU (3143:2467)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0.42 * fem, 140.16 * fem, 0 * fem),
                      width: 24.58 * fem,
                      height: 17.09 * fem,
                      child: Image.asset(
                        'assets/mobile/images/backarrow.png',
                        width: 24.58 * fem,
                        height: 17.09 * fem,
                      ),
                    ),
                    Text(
                      // createzji (3143:2466)
                      'Create',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Poppins',
                        fontSize: 18 * ffem,
                        fontWeight: FontWeight.w500,
                        height: 1.5 * ffem / fem,
                        letterSpacing: 0.54 * fem,
                        color: Color(0xff000000),
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
