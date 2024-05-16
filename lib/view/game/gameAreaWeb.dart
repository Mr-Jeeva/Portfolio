import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/resource/appClass.dart';
import 'package:portfolio/view/game/tetris.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../../controller/generalController.dart';
import '../../resource/colors.dart';

class GameAreaWeb extends ConsumerStatefulWidget {
  var scrollController;

  GameAreaWeb(this.scrollController, {Key? key}) : super(key: key);

  @override
  ConsumerState<GameAreaWeb> createState() => _GameAreaWebState();
}

class _GameAreaWebState extends ConsumerState<GameAreaWeb> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppClass().getMqHeight(context) - 70,
      child: Consumer(builder: (context, ref, child) {
        String? scrType = ref.watch(gameScreenProvider);
        switch (scrType) {
          case null:
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Consumer(builder: (context, ref, child) {
                  var data = ref.watch(hoverProvider);
                  bool isHovered = (data == "tetris");

                  return InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => AlertDialog(
                                title: Text("Warning"),
                                content: Text("Play Area is still in development, May have some bugs.\nAre you sure, you want to continue."),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("CANCEL")),
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        ref.read(gameScreenProvider.notifier).state = "tetris";
                                        widget.scrollController.scrollToIndex(4, preferPosition: AutoScrollPosition.begin);
                                      },
                                      child: Text("CONFIRM")),
                                ],
                              ));
                    },
                    onHover: (bol) {
                      if (bol) {
                        ref.read(hoverProvider.notifier).state = "tetris";
                      } else {
                        ref.read(hoverProvider.notifier).state = "";
                      }
                    },
                    child: Container(
                      decoration:
                          BoxDecoration(color: isHovered ? AppColors().neonColor.withOpacity(0.2) : Colors.transparent, border: Border.all(width: 1, color: AppColors().neonColor.withOpacity(0.2))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/svg/tetris.svg", width: AppClass().getMqWidth(context) * 0.2, height: AppClass().getMqHeight(context) * 0.2),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              "Tetris",
                              style: GoogleFonts.quando(fontSize: AppClass().getMqWidth(context) * 0.025, color: Colors.white70),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                })),
                Expanded(
                    child: Container(
                  color: Colors.yellowAccent.withOpacity(0.2),
                  child: Center(
                      child: Text(
                    "Coming Soon",
                    style: TextStyle(color: Colors.white.withOpacity(0.3)),
                  )),
                )),
                Expanded(
                    child: Container(
                  color: Colors.blueAccent.withOpacity(0.2),
                  child: Center(
                      child: Text(
                    "Coming Soon",
                    style: TextStyle(color: Colors.white.withOpacity(0.3)),
                  )),
                )),
              ],
            );
          case "tetris":
            return Tetris(widget.scrollController);
          default:
            return Center(child: Text("error"));
        }
      }),
    );
  }
}
