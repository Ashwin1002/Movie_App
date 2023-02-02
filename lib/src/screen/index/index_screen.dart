import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:movie_app/src/constant/api_constant.dart';
import 'package:movie_app/src/constant/asset_list.dart';
import 'package:movie_app/src/constant/colors.dart';
import 'package:movie_app/src/screen/index/index_model.dart';
import 'package:movie_app/src/screen/index/index_state.dart';
import 'package:movie_app/src/widget/custom_network_image.dart';
import 'package:movie_app/src/widget/title_heading_row.dart';
import 'package:movie_app/src/widget/widget_space.dart';
import 'package:provider/provider.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({Key? key}) : super(key: key);

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  late int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    Provider.of<IndexState>(context, listen: false).getContext = context;
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<IndexState>();

    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const CustomNetworkImage(
                        imageUrl: '',
                        shape: BoxShape.circle,
                      ),
                      horizontalSpace(width: 10.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Text(
                                'Hello ',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300
                                ),
                              ),
                              Text(
                                'Aliza,',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  letterSpacing: 0.6,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          verticalSpace(height: 2.0),
                          const Text(
                            'Book your favourite movie ',
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.white,
                                fontWeight: FontWeight.w300
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      AssetList.navNotify,
                      height: 26.0,
                      width: 26.0,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            verticalSpace(height: 15.0),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18.0,
                      ),
                      child: TextField(
                        cursorColor: Colors.blueAccent,
                        decoration: InputDecoration(
                          hintText: 'Search Movies...',
                          hintStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 13.0,
                              letterSpacing: 0.8),
                          suffixIcon: const Icon(
                            Icons.tune_outlined,
                            color: Colors.white,
                            size: 20.0,
                          ),
                          prefixIcon: const Icon(
                            IonIcons.search,
                            color: Colors.white,
                            size: 20.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          fillColor: Colors.white.withOpacity(0.3),
                          filled: true,
                          contentPadding: const EdgeInsets.only(
                              left: 15, bottom: 11, top: 11, right: 15),
                          focusedBorder: null,
                          enabledBorder: null,
                          disabledBorder: null,
                        ),
                      ),
                    ),
                    verticalSpace(height: 20),
                    const TitleHeadingRow(
                        heading: "Now Showing", subHeading: "See more"),
                    verticalSpace(height: 20),
                    if (state.movieList.isNotEmpty)
                      SizedBox(
                        height: 250.0,
                        child: PageView.builder(
                          physics: const BouncingScrollPhysics(),
                          onPageChanged: (index) {
                            _selectedIndex = index;
                            setState(() {});
                          },
                          controller: PageController(viewportFraction: 0.48),
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            final indexItem = state.movieList[index];

                            var scale = _selectedIndex == index ? 1.0 : 0.8;

                            return TweenAnimationBuilder(
                              duration: const Duration(milliseconds: 250),
                              tween: Tween(begin: scale, end: scale),
                              curve: Curves.ease,
                              builder: (BuildContext context, double value,
                                  Widget? child) {
                                return Transform.scale(
                                  scale: value,
                                  child: child,
                                );
                              },
                              child: buildImage(
                                state.movieList,
                                indexItem,
                                index,
                              ),
                            );
                          },
                        ),
                      ),
                    verticalSpace(height: 15.0),
                    if (state.movieList.isNotEmpty)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...List.generate(
                            3,
                            (index) => Indicator(
                                isActive:
                                    _selectedIndex == index ? true : false),
                          )
                        ],
                      ),
                    verticalSpace(height: 20),
                    const TitleHeadingRow(
                        heading: "Animation Film", subHeading: "See more"),
                    verticalSpace(height: 20),
                    if (state.oldMovieList.isNotEmpty)
                      SizedBox(
                        height: 203,
                        child: ListView.builder(
                          itemCount: 5,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final indexItem = state.oldMovieList[index];
                            return Container(
                              margin: EdgeInsets.only(
                                  left: index == 0 ? 14.0 : 0, right: 18.0),
                              child: CustomNetworkImage(
                                width: 143,
                                borderRadius: BorderRadius.circular(14.0),
                                imageUrl:
                                    "${ConstantAPIText.imageUrl}${indexItem.posterPath}",
                              ),
                            );
                          },
                        ),
                      ),
                    verticalSpace(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImage(
      List<MovieDataModel> listModel, MovieDataModel indexItem, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Stack(
        fit: StackFit.expand,
        children: [
          SizedBox(
            width: 200,
            height: 278,
            child: CustomNetworkImage(
              imageUrl: "${ConstantAPIText.imageUrl}${indexItem.posterPath}",
            ),
          ),
          ClipRRect(
            child: SizedBox(
              width: 200,
              height: 278,
              child: BackdropFilter(
                filter: ImageFilter.blur(
                    sigmaX: _selectedIndex == index ? 0 : 3,
                    sigmaY: _selectedIndex == index ? 0 : 3),
                child: const Text(
                  "",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  const Indicator({Key? key, required this.isActive}) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3.0),
      width: isActive ? 25.0 : 8.0,
      height: 8.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: isActive ? indicatorColor : Colors.grey,
      ),
    );
  }
}
