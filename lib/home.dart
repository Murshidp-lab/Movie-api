import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled6/BLOC/movie_bloc.dart';
import 'package:untitled6/details.dart';

import 'package:untitled6/repository/model%20class/movie%20%20model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    BlocProvider.of<MovieBloc>(context).add(fetchMovieEvent());
  }

  late Moviemodel Movies;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(left: 10.w, top: 10.h),
            child: Row(
              children: [
                Icon(
                  Icons.menu,
                  size: 30.sp,
                ),
                SizedBox(
                  width: 110.w,
                ),
                Text(
                  'FilmKu',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF110E47),
                    fontSize: 16.sp,
                    fontFamily: 'Merriweather',
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.32,
                  ),
                ),
                SizedBox(
                  width: 100.w,
                ),
                Icon(
                  Icons.notifications_none_outlined,
                  size: 30.sp,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 40.h, left: 20.w),
            child: Row(
              children: [
                Text(
                  'Now Showing',
                  style: TextStyle(
                    color: Color(0xFF110E46),
                    fontSize: 16.sp,
                    fontFamily: 'Merriweather',
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.32,
                  ),
                ),
                SizedBox(
                  width: 130.w,
                ),
                Text(
                  'See more',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Color(0xFFAAA8B0),
                    fontSize: 12.sp,
                    fontFamily: 'Mulish',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.w, top: 10.h),
            child: SizedBox(
              height: 340.h,
              child: BlocBuilder<MovieBloc, MovieState>(
                builder: (context, state) {
                  if (state is movieloding) {
                    return Center(child: (CircularProgressIndicator()));
                  }
                  if (state is movieerror) {
                    return RefreshIndicator(
                        child: Center(child: Text("something is wrong")),
                        onRefresh: () async {
                          return BlocProvider.of<MovieBloc>(context)
                              .add(fetchMovieEvent());
                        });
                  }
                  if (state is movieloded) {
                    Movies = BlocProvider.of<MovieBloc>(context).moviemodel;
                    return ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: Movies.movies!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => Details(
                                      Image: Movies.movies![index].backdropPath
                                          .toString(),
                                      title: Movies.movies![index].title
                                          .toString(), generes: Movies.movies![index].genres!,
                                  description: Movies.movies![index].overview.toString(),
                                    )));
                          },
                          child: Container(
                            width: 200.w,
                            height: 295.h,
                            color: Colors.white,
                            child: Column(
                              children: [
                                Container(
                                    height: 252.h,
                                    width: 200.w,
                                    child: Image.network(
                                      Movies.movies![index].backdropPath
                                          .toString(),
                                      fit: BoxFit.cover,
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(right: 40.w),
                                  child: Text(
                                    Movies.movies![index].title.toString(),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.sp,
                                      fontFamily: 'Mulish',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Row(
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
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 20.w,
                        );
                      },
                    );
                  } else {
                    return SizedBox();
                  }
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Row(
              children: [
                Text(
                  'Popular',
                  style: TextStyle(
                    color: Color(0xFF110E47),
                    fontSize: 16.sp,
                    fontFamily: 'Merriweather',
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(
                  width: 180.w,
                ),
                Container(
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
                )
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          SizedBox(
              height: 200.h,
              width: double.infinity,
              child: BlocBuilder<MovieBloc, MovieState>(
                builder: (context, state) {
                  if (state is movieloding){
                    return Center(child: CircularProgressIndicator());
                  }
                  if (state is movieerror){
                    return RefreshIndicator(child: Text("somthinge is wrong "), onRefresh:()async {
                      return BlocProvider.of<MovieBloc>(context).add(fetchMovieEvent());
                    } );

                  }
                  if(state is movieloded ){
                    Movies =BlocProvider.of<MovieBloc>(context).moviemodel;
                    return ListView.separated(
                    itemCount: Movies.movies!.length,
                    itemBuilder: (BuildContext, int index) {
                      return Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => Details(
                                    Image: Movies
                                        .movies![index].backdropPath
                                        .toString(),
                                    title: Movies.movies![index].title
                                        .toString(),
                                    generes: Movies
                                    .movies![index].genres!,
                                    description: Movies.movies![index].overview.toString()
                                    ,
                                  )));
                            },
                            child: Container(
                              width: 330.w,
                              height: 130.h,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            height: 150.h,
                            width: 140.w,
                            child: Image.network(
                              fit: BoxFit.cover,
                              Movies.movies![index].backdropPath.toString(),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 150.w, top: 10.h),
                            child: Text(
                              Movies.movies![index].title.toString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontFamily: 'Mulish',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 145.w, top: 55.h),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star_rate,
                                  color: Colors.yellowAccent,
                                ),
                                Text(
                                  '6.4/10 IMDb',
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
                            padding:  EdgeInsets.only(top: 100.h),
                            child: SizedBox(
                              height: 20.h,
                              width: 250.w,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                Movies.movies![index].genres!.length,
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
                                        Movies.movies![index]
                                            .genres![position]
                                            .toString(),
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
                        ],
                      );
                    },
                    separatorBuilder: (Buildcontext, int index) {
                      return SizedBox(
                        height: 10.h,
                      );
                    },
                  );

                  } else{
                    return SizedBox();
                  }

                },
              ))
        ]),
      )),
    );
  }
}
