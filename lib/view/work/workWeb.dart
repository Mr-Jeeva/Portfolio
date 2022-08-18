import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/controller/generalController.dart';
import 'package:portfolio/resource/appClass.dart';

import '../../resource/colors.dart';

class WorkWeb extends ConsumerStatefulWidget {
  const WorkWeb({Key? key}) : super(key: key);

  @override
  ConsumerState<WorkWeb> createState() => _WorkWebState();
}

class _WorkWebState extends ConsumerState<WorkWeb> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'My Noteworthy Projects',
          style: GoogleFonts.roboto(
              color: AppColors().textColor,
              letterSpacing: 1,
              fontWeight: FontWeight.bold,
              fontSize: 25),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            'view the archives',
            style: TextStyle(
                color: AppColors().neonColor,
                fontSize: 15,
                fontFamily: 'sfmono'),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 30.0, bottom: 60.0),
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
      ],
    );
  }

  Tile({required int index}) {
    return InkWell(
      onTap: () {},
      onHover: (bool) {
        if (bool) {
          ref.read(hoverProvider.notifier).state = "$index";
        } else {
          ref.read(hoverProvider.notifier).state = "";
        }
      },
      child: Consumer(builder: (context, ref, child) {
        String data = ref.watch(hoverProvider);
        bool isHovered = (data == "$index");
        return Container(
          margin: EdgeInsets.all(isHovered ? 8.0 : 0.0),
          child: Card(
            color: AppColors().cardColor,
            elevation: 10,
            child: Container(
              padding: EdgeInsets.all(15.0),
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
                        color: AppColors().neonColor,
                      ),
                      SvgPicture.asset(
                        'assets/svg/externalLink.svg',
                        width: 22,
                        height: 22,
                        color: isHovered ? AppColors().neonColor : Colors.white,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 8.0),
                    child: Row(
                      children: [
                        Text(
                          AppClass().projectList[index].projectTitle.toString(),
                          textAlign: TextAlign.left,
                          style: GoogleFonts.robotoSlab(
                              color: isHovered
                                  ? AppColors().neonColor
                                  : Colors.white,
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
                        AppClass().projectList[index].projectContent.toString(),
                        style: GoogleFonts.roboto(
                          color: AppColors().textLight,
                          letterSpacing: 1,
                          height: 1.5,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        AppClass().projectList[index].tech1.toString(),
                        style: GoogleFonts.roboto(
                          color: AppColors().textLight,
                          letterSpacing: 1,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        AppClass().projectList[index].tech2.toString(),
                        style: GoogleFonts.roboto(
                          color: AppColors().textLight,
                          letterSpacing: 1,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        AppClass().projectList[index].tech3.toString(),
                        style: GoogleFonts.roboto(
                          color: AppColors().textLight,
                          letterSpacing: 1,
                          height: 1.5,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
