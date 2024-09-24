import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled6/repository/model%20class/movie%20%20model.dart';

class Details extends StatefulWidget {
  final String Image;
  final String title;
  final List<dynamic> generes;
  final String description;


  const Details({super.key, required this.Image, required this.title, required this.generes, required this.description});


  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(height: 300.h,width: 400.w,
              child: Image.network(fit: BoxFit.cover,
               widget.Image,
              ),
            ),
            Stack(children: [
              Container(
                width: 375.w,
                height: 500.h,
                decoration: ShapeDecoration(
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.r),
                      topRight: Radius.circular(10.r),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w, top: 20.h),
                child: Text(
                  widget.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontFamily: 'Mulish',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 320.w, top: 20.h),
                child: Icon(
                  Icons.bookmark_border_rounded,
                  color: Colors.white,
                  size: 30.sp,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w, top: 80.h),
                child: Row(
                  children: [
                    Icon(
                      Icons.star_rate,
                      color: Colors.yellowAccent,
                    ),
                    Text(
                      '9.1/10 IMDb',
                      style: TextStyle(
                        color: Color(0xFF9B9B9B),
                        fontSize: 12.sp,
                        fontFamily: 'Mulish',
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top: 120.h,left: 20.w),
                child: SizedBox(
                  height: 20.h,width: 310.w,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount:
                   widget.generes.length,
                    itemBuilder: (
                        BuildContext,
                        int position,
                        ) {
                      return Container(
                        height: 20.h,
                        width: 70.w,
                        decoration: ShapeDecoration(
                          color: Color(0xFFDBE3FF),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(100.r),
                          ),
                        ),
                        child: Center(
                          child: Text(
                           widget.generes[position].toString(),
                            style: TextStyle(fontSize: 8.sp),
                          ),
                        ),
                      );
                    },
                    separatorBuilder:
                        (Buildcontext, int position) {
                      return SizedBox(width: 5.w);
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w, top: 150.h),
                child: Row(
                  children: [
                    Text(
                      'Length',
                      style: TextStyle(
                        color: Color(0xFF9B9B9B),
                        fontSize: 12.sp,
                        fontFamily: 'Mulish',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      width: 60.w,
                    ),
                    Text(
                      'Language',
                      style: TextStyle(
                        color: Color(0xFF9B9B9B),
                        fontSize: 12.sp,
                        fontFamily: 'Mulish',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      width: 60.w,
                    ),
                    Text(
                      'Rating',
                      style: TextStyle(
                        color: Color(0xFF9B9B9B),
                        fontSize: 12.sp,
                        fontFamily: 'Mulish',
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w, top: 165.h),
                child: Row(
                  children: [
                    Text(
                      '2h 28min',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontFamily: 'Mulish',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: 50.w,
                    ),
                    Text(
                      'English',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontFamily: 'Mulish',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: 70.w,
                    ),
                    Text(
                      'PG-13',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontFamily: 'Mulish',
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 200.h, left: 20.w),
                child: Text(
                  'Description',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontFamily: 'Merriweather',
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top: 230.h,left: 20.w),
                child: Text(
                  'With Spider-Man s identity now revealed, Peter asks Doctor Strange for help. When a spell goes wrong, dangerous foes from other worlds start to appear, forcing Peter to discover what it truly means to be Spider-Man.',
                  style: TextStyle(
                    color: Color(0xFF9B9B9B),
                    fontSize: 12.sp,
                    fontFamily: 'Muli',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(left: 20.w,top: 330.h),
                child: Row(
                  children: [
                    Text(
                      'Cast',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontFamily: 'Merriweather',
                        fontWeight: FontWeight.w900,

                      ),
                    ),
                    SizedBox(width: 220.w,),Container(
                      width: 61.w,
                      height: 21.h,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1.w, color: Color(0xFFE5E4EA)),
                          borderRadius: BorderRadius.circular(100.r),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'See more',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Color(0xFFAAA8B0),
                            fontSize: 10.sp,
                            fontFamily: 'Mulish',
                            fontWeight: FontWeight.w400,

                          ),
                        ),
                      ),
                    ) ],
                ),
              ),
              SingleChildScrollView(scrollDirection: Axis.horizontal,
                child:
                  Padding(
                    padding:  EdgeInsets.only(left: 20.w,top: 370.h),
                    child: Row(
                      children: [
                        Container(width: 100.w,height: 130.h,color: Colors.black,
                        child: Column(
                          children: [
                            Image.asset("assets/f.png"),
                           SizedBox(height: 5.h,), Text(
                              'Tom Holland',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.sp,
                                fontFamily: 'Muli',
                                fontWeight: FontWeight.w400,

                              ),
                            )
                          ],
                        ),),
                      SizedBox(width: 15.w,),  Container(width: 100.w,height: 130.h,color: Colors.black,
                          child: Column(
                            children: [
                              Image.asset("assets/g.png"),
                              SizedBox(height: 5.h,), Text(
                                'Zendaya',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontFamily: 'Muli',
                                  fontWeight: FontWeight.w400,

                                ),
                              )
                            ],
                          ),),
                        SizedBox(width: 15.w,),Container(width: 100.w,height: 130.h,color: Colors.black,
                          child: Column(
                            children: [
                              Image.asset("assets/h.png"),
                              SizedBox(height: 5.h,), Text(
                                'Benedict\nCumberbatch',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontFamily: 'Muli',
                                  fontWeight: FontWeight.w400,

                                ),
                              )
                            ],
                          ),),
                        SizedBox(width: 15.w,),Container(width: 100.w,height: 130.h,color: Colors.black,
                          child: Column(
                            children: [
                              Image.asset("assets/i.png"),
                              SizedBox(height: 5.h,), Text(
                                'Jacon\nBatalon',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontFamily: 'Muli',
                                  fontWeight: FontWeight.w400,

                                ),
                              )
                            ],
                          ),),
                      ],
                    ),
                  ),

              ),

            ]),
          ],
        ),
      ),
    );
  }
}
