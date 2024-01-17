import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
      child: Consumer(
        builder: (context, ref, child) {
          String? scrType = ref.watch(gameScreenProvider);
          switch(scrType) {
            case null:
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Consumer(
                      builder: (context, ref, child) {
                        var data = ref.watch(hoverProvider);
                        bool isHovered = (data == "tetris");

                        return InkWell(
                          onTap: () {
                            showDialog(context: context,
                                barrierDismissible: false,
                                builder: (context) => AlertDialog(
                                  title: Text("Warning"),
                                  content: Text("Play Area is still in development, May have some bugs.\nAre you sure, you want to continue."),
                                  actions: [
                                    ElevatedButton(onPressed: () {
                                      Navigator.pop(context);
                                    }, child: Text("CANCEL")),
                                    ElevatedButton(onPressed: () {
                                      Navigator.pop(context);
                                      ref.read(gameScreenProvider.notifier).state = "tetris";
                                      widget.scrollController.scrollToIndex(4, preferPosition: AutoScrollPosition.begin);
                                    }, child: Text("CONFIRM")),
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          colorFilter: ColorFilter.mode(
                                              AppColors().primaryColor,
                                              isHovered
                                                  ? BlendMode.lighten
                                                  : BlendMode.color),
                                          image: AssetImage(
                                              'assets/tetris.png')),
                                      color: Colors.transparent),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                  )),
                  Expanded(child: Container(color: Colors.yellowAccent.withOpacity(0.2), child: Center(child: Text("Coming Soon", style: TextStyle(color: Colors.white.withOpacity(0.3)),)),)),
                  Expanded(child: Container(color: Colors.blueAccent.withOpacity(0.2), child: Center(child: Text("Coming Soon", style: TextStyle(color: Colors.white.withOpacity(0.3)),)),)),
                ],
              );
            case "tetris":
              return Tetris();
            default:
              return Center(child: Text("error"));
          }
        }
      ),
    );
  }
}
