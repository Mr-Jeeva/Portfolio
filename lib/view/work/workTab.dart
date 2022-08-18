import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../resource/colors.dart';

class WorkMobile extends StatefulWidget {
  const WorkMobile({Key? key}) : super(key: key);

  @override
  State<WorkMobile> createState() => _WorkMobileState();
}

class _WorkMobileState extends State<WorkMobile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: EdgeInsets.only(top: 30.0, bottom: 10.0),
        child: StaggeredGrid.count(
          crossAxisCount: 3,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          children: [
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: Tile(index: 0),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: Tile(index: 1),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: Tile(index: 2),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: Tile(index: 3),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: Tile(index: 4),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: Tile(index: 5),
            ),
          ],
        ),
      ),
    );
  }

  Tile({required int index}) {
    return Card(
      color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  'assets/svg/folder.svg',
                  width: 45,
                  height: 45,
                ),
                SvgPicture.asset(
                  'assets/svg/externalLink.svg',
                  width: 20,
                  height: 20,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 8.0),
              child: Row(
                children: [
                  Text(
                    'Sample Title',
                    style: GoogleFonts.robotoSlab(
                        color: Colors.white,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Text(
                  'Hello! My name is Jeeva and I enjoy creating things that live on the internet. My interest in mobile/web development started back in 2019 when I decided to clone some applications — turns my passion into profession.',
                  style: GoogleFonts.roboto(
                    color: AppColors().textLight,
                    letterSpacing: 1,
                    height: 1.5,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'tech 1',
                  style: GoogleFonts.roboto(
                    color: AppColors().textLight,
                    letterSpacing: 1,
                    height: 1.5,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'tech 2',
                  style: GoogleFonts.roboto(
                    color: AppColors().textLight,
                    letterSpacing: 1,
                    height: 1.5,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'tech 3',
                  style: GoogleFonts.roboto(
                    color: AppColors().textLight,
                    letterSpacing: 1,
                    height: 1.5,
                    fontSize: 16,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
