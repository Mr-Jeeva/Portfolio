import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/controller/generalController.dart';
import 'package:portfolio/resource/appClass.dart';

import '../../resource/colors.dart';

class Tetris extends ConsumerStatefulWidget {
  const Tetris({Key? key}) : super(key: key);

  @override
  ConsumerState<Tetris> createState() => _TetrisState();
}

class _TetrisState extends ConsumerState<Tetris> {
  List<Map<int, List<int>>> bricks = getDefaultBricks();

  List<int> currentBrick = [];
  Timer? _timer;
  List<int> ocupiedPos = [];

  int pos = 0, randInt = 0;
  int? nxtInt = null;
  var scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
          body: Row(
        children: [
          Expanded(child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  SvgPicture.asset("assets/svg/tetrisLogo.svg",
                    color: AppColors().neonColor.withOpacity(0.5),
                    width: AppClass().getMqWidth(context) * 0.15,
                    height: AppClass().getMqHeight(context) * 0.15),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Text("Tetris", style: GoogleFonts.rubikGlitch(
                        color: Colors.white,
                        fontSize: 31,
                        letterSpacing: 1)),
                  ),
                ],
              ),
              Container(
                color: AppColors().neonColor,
                margin: EdgeInsets.only(left: 10, right: 10),
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      children: [
                        Text("High Score", style: GoogleFonts.robotoSlab(
                          fontSize: 35,
                            color: AppColors().primaryColor
                        )),
                        Text("-", style: GoogleFonts.robotoSlab(
                            fontSize: 31,
                            color: AppColors().primaryColor
                        ))
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                color: AppColors().neonColor,
                padding: EdgeInsets.only(top: 5, bottom: 5),
                margin: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      children: [
                        Text("Your Score", style: GoogleFonts.robotoSlab(
                            fontSize: 35,
                          color: AppColors().primaryColor
                        )),
                        Consumer(
                          builder: (context, ref, child) {
                            int currentScore = ref.watch(scoreProvider);
                            return Text("${currentScore} pts", style: GoogleFonts.robotoSlab(
                                fontSize: 31,
                                color: AppColors().primaryColor
                            ));
                          }
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
          /*Expanded(
              child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 10, childAspectRatio: AppClass().getMqWidth(context) * 0.23),
                  itemCount: 200,
                  itemBuilder: (context, index) {
                    return Container(
                      color: () {
                        if (ocupiedPos.contains(index + 1) ||
                            currentBrick.contains(index + 1)) {
                          return Colors.red;
                        }
                        return Colors.black12;
                      }(),
                      margin: const EdgeInsets.all(1),
                      child: Center(
                        child: Text("${index + 1}"),
                      ),
                    );
                  })),*/
          Expanded(
              child: Container(
            padding: const EdgeInsets.only(top: 8.0),
            margin: EdgeInsets.only(left: 10),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 20,
                controller: scrollController,
                itemBuilder: (con, i) {
                  return Container(
                    height: AppClass().getMqHeight(context) * 0.04,
                    child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (con, j) {
                        return Container(
                          margin: EdgeInsets.all(0.1),
                          color: () {
                            if (ocupiedPos.contains((i * 10) + j + 1) ||
                                currentBrick.contains((i * 10) + j + 1)) {
                              return Colors.red;
                            }
                            return Colors.black12;
                          }(),
                          width: AppClass().getMqHeight(context) * 0.04,
                          //child: Text("${(i * 10) + j + 1}"),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white.withOpacity(0.2))
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }),
          )),
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: Center(
                    child: Column(
                      children: [
                        Image.asset((){
                          switch(nxtInt) {
                            case 0:
                              return "assets/square.png";
                            case 1:
                              return "assets/line.png";
                            case 2:
                              return "assets/lleft.png";
                            case 3:
                              return "assets/lright.png";
                            case 4:
                              return "assets/na.png";
                            default:
                              return "assets/na.png";
                          }
                          return "";
                        }(),
                            height: AppClass().getMqHeight(context) * 0.2,
                            width: AppClass().getMqWidth(context) * 0.2),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text("Up Next", style: GoogleFonts.robotoSlab(
                              fontSize: 31,
                              color: Colors.white
                          )),
                        )
                      ],
                    ),
                  )),
                  Expanded(child: Center(child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Text("Play area is completely developed by myself with 0% googling and plugin usage. It still in the Beta level, so it may contains some bug. ", textAlign: TextAlign.center,),
                  ))),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                    onPressed: () {
                                      String leftBrick = currentBrick[0].toString();
                                      if (leftBrick.substring(leftBrick.length - 1, leftBrick.length) != "1") {
                                        if(!(bricks[randInt][pos]!.any((element) => ocupiedPos.contains(element - 1)))) {
                                          brickDown("left");
                                        }
                                        currentBrick.clear();
                                        currentBrick.addAll(bricks[randInt][pos]!);
                                      }
                                    },
                                    child: const Text('Left')),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                    onPressed: () {
                                      String leftBrick = currentBrick[3].toString();
                                      if (leftBrick.substring(leftBrick.length - 1, leftBrick.length) != "0") {
                                        if(!(bricks[randInt][pos]!.any((element) => ocupiedPos.contains(element + 1)))) {
                                          brickDown("right");
                                        }
                                        currentBrick.clear();
                                        currentBrick.addAll(bricks[randInt][pos]!);
                                      }
                                    },
                                    child: const Text('Right')),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                    onPressed: () {
                                      int val = pos;
                                      if(!(bricks[randInt][ val < 3 ? val + 1 : val = 0]!.any((element) => ocupiedPos.contains(element)))) {
                                        rotate();
                                      }
                                    },
                                    child: const Text('Rotate')),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                    onPressed: () {
                                      ref.refresh(scoreProvider);

                                      startGame();
                                    },
                                    child: const Text('Start')),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                    onPressed: () {
                                      quit();
                                    },
                                    child: const Text('Quit')),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }

  startGame() {
    ref.read(scrollHandlerProvider.notifier).update((state) => false);
    bool hasReachFloor = false, canGo = true;
    randInt = getRandInt();
    print("randInt-> ${randInt}");
    pos = 0;
    bricks.clear();
    bricks = getDefaultBricks();
    currentBrick.addAll(getDefaultBricks()[randInt][pos]!);
    _timer = Timer.periodic(
      const Duration(milliseconds: 500), (Timer timer) {
        checkClearRow();
        if (isGameOver()) {
          _timer!.cancel();
          showDialog(context: context,
              builder: (c) {
                return AlertDialog(
                  title: const Text('Game Over'),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          ref.refresh(scoreProvider);
                          startAgain();
                        },
                        child: const Text('Start Again')),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(c);
                          quit();
                        },
                        child: const Text('Quit'))
                  ],
                );
              });
        } else {
          if (hasReachFloor == false && canGo == true) {
            if (currentBrick[0] > 190 ||
                currentBrick[1] > 190 ||
                currentBrick[2] > 190 ||
                currentBrick[3] > 190) {
              hasReachFloor = true;
              return;
            }
            if (ocupiedPos.contains(currentBrick[0] + 10) ||
                ocupiedPos.contains(currentBrick[1] + 10) ||
                ocupiedPos.contains(currentBrick[2] + 10) ||
                ocupiedPos.contains(currentBrick[3] + 10)) {
              canGo = false;
              return;
            }
            brickDown("down");
            //changeBrickValue('down');
            currentBrick.clear();
            currentBrick.addAll(bricks[randInt][pos]!);
          } else {
            ocupiedPos.addAll(currentBrick);
            currentBrick.clear();
            timer.cancel();
            startGame();
          }
        }
        setState(() {});
      },
    );
  }

  bool isGameOver() {
    if (ocupiedPos.contains(11) ||
        ocupiedPos.contains(12) ||
        ocupiedPos.contains(13) ||
        ocupiedPos.contains(14) ||
        ocupiedPos.contains(15) ||
        ocupiedPos.contains(16) ||
        ocupiedPos.contains(17) ||
        ocupiedPos.contains(18) ||
        ocupiedPos.contains(19) ||
        ocupiedPos.contains(20)) {
      return true;
    }
    return false;
  }

  startAgain() {
    Navigator.pop(context);
    ocupiedPos.clear();
    startGame();
  }

  quit() {
    ref.read(scrollHandlerProvider.notifier).update((state) => true);
    ocupiedPos.clear();
    currentBrick.clear();
    ref.refresh(gameScreenProvider);
    setState(() {});
  }

  rotate() {
    int tempPos = pos;

    if (tempPos < 3) {
      tempPos++;
    } else {
      tempPos = 0;
    }
    String zeroBrick = bricks[randInt][tempPos]![0].toString();
    String firstBrick = bricks[randInt][tempPos]![1].toString();
    String secondBrick = bricks[randInt][tempPos]![2].toString();
    String thirdBrick = bricks[randInt][tempPos]![3].toString();

    if(zeroBrick.substring(zeroBrick.length - 1, zeroBrick.length) != "1" &&
        zeroBrick.substring(zeroBrick.length - 1, zeroBrick.length) != "0" &&

        firstBrick.substring(firstBrick.length - 1, firstBrick.length) != "1" &&
        firstBrick.substring(firstBrick.length - 1, firstBrick.length) != "0" &&

        secondBrick.substring(secondBrick.length - 1, secondBrick.length) != "1" &&
        secondBrick.substring(secondBrick.length - 1, secondBrick.length) != "0" &&

        thirdBrick.substring(thirdBrick.length - 1, thirdBrick.length) != "1" &&
        thirdBrick.substring(thirdBrick.length - 1, thirdBrick.length) != "0") {
      pos = tempPos;
    }

  }

  static getDefaultBricks() {
    return [
      {
        0: [5, 6, 15, 16],
        1: [5, 6, 15, 16],
        2: [5, 6, 15, 16],
        3: [5, 6, 15, 16],
      },
      {
        0: [4, 5, 6, 7],
        1: [6, 16, 26, 36],
        2: [4, 5, 6, 7],
        3: [6, 16, 26, 36],
      },
      {
        0: [5, 15, 16, 17],
        1: [5, 6, 15, 25],
        2: [4, 5, 6, 16],
        3: [6, 16, 26, 25],
      },
      {
        0: [14, 15, 16, 6],
        1: [5, 15, 25, 26],
        2: [5, 15, 6, 7],
        3: [5, 6, 16, 26],
      },
    ];
  }

  brickDown(type) {
    for(int i = 0; i <= 3 ; i++) {
      for(int j = 0; j <= 3; j++) {
        if(type == "down") {
          bricks[randInt][i]![j] = bricks[randInt][i]![j] + 10;
        } else if(type == "left") {
            bricks[randInt][i]![j] = bricks[randInt][i]![j] - 1;
        } else if(type == "right") {
          bricks[randInt][i]![j] = bricks[randInt][i]![j] + 1;
        }
      }
    }
  }

  checkClearRow() {
    ocupiedPos.sort();
    for (int i = 1; i <= 20; i++) {
      if (checkRow((i * 10) - 9, i * 10)) {
        ocupiedPos.removeRange(ocupiedPos.indexOf((i * 10) - 9), ocupiedPos.indexOf(i * 10));
        ocupiedPos.removeAt(ocupiedPos.indexOf(i * 10));

        ref.read(scoreProvider.notifier).state = ref.read(scoreProvider.notifier).state + 100;

        ocupiedPos.forEach((element) {
          if(element < i*10) {
            ocupiedPos[ocupiedPos.indexOf(element)] = element + 10;
          }
        });
      }
    }
  }

  checkRow(int a, int b) {
    List<bool> rowOccupied = [];
    rowOccupied.clear();
    for (int i = a; i <= b; i++) {
      rowOccupied.add(ocupiedPos.contains(i));
    }
    return !rowOccupied.contains(false);
  }

  int getRandInt() {
    if(nxtInt == null) {
      nxtInt = Random().nextInt(4);
    }
    randInt = nxtInt ?? 0;
    nxtInt = Random().nextInt(4);
    setState(() {});
    return randInt;
  }

}
