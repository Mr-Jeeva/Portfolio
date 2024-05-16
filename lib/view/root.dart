import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/controller/generalController.dart';
import 'package:portfolio/resource/appClass.dart';
import 'package:portfolio/view/about/about.dart';
import 'package:portfolio/view/experience/experience.dart';
import 'package:portfolio/view/game/gameArea.dart';
import 'package:portfolio/view/intro/intro.dart';
import 'package:portfolio/view/widget/appBar.dart';
import 'package:portfolio/view/widget/leftPane.dart';
import 'package:portfolio/view/widget/rightPane.dart';
import 'package:portfolio/view/work/work.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'contact/contact.dart';

class RootScreen extends ConsumerStatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends ConsumerState<RootScreen> {
  final mScrollController = AutoScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final ScrollDirection direction = notification.direction;
            if (direction == ScrollDirection.reverse) {
              ref.read(scrollControlProvider.notifier).state = false;
            } else if (direction == ScrollDirection.forward) {
              ref.read(scrollControlProvider.notifier).state = true;
            }
            return true;
          },
          child: Container(
            decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [Color(0xff112240), Color(0xff0a192f), Color(0xff020c1b)])),
            height: AppClass().getMqHeight(context),
            child: Column(
              children: [
                Consumer(builder: (context, ref, child) {
                  var isScrollingUp = ref.watch(scrollControlProvider);
                  return AnimatedOpacity(
                    opacity: isScrollingUp ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: ActionBar(mScrollController),
                  );
                }),
                Expanded(
                  child: () {
                    ScreenType scrType = AppClass().getScreenType(context);
                    return Row(
                      children: [
                        scrType == ScreenType.mobile ? SizedBox() : LeftPane(),
                        Expanded(
                            flex: 8,
                            child: Consumer(builder: (context, ref, child) {
                              bool scrollHandler = ref.watch(scrollHandlerProvider);
                              return ListView(
                                physics: scrollHandler ? AlwaysScrollableScrollPhysics() : NeverScrollableScrollPhysics(),
                                controller: mScrollController,
                                children: [
                                  AutoScrollTag(key: ValueKey(0), controller: mScrollController, index: 0, child: IntroContent(mScrollController)),
                                  AutoScrollTag(key: ValueKey(1), controller: mScrollController, index: 1, child: About()),
                                  AutoScrollTag(key: ValueKey(2), controller: mScrollController, index: 2, child: Experience()),
                                  AutoScrollTag(key: ValueKey(3), controller: mScrollController, index: 3, child: Work()),
                                  AutoScrollTag(key: ValueKey(4), controller: mScrollController, index: 4, child: GameArea(mScrollController)),
                                  AutoScrollTag(key: ValueKey(5), controller: mScrollController, index: 5, child: Contact())
                                ],
                              );
                            })),
                        scrType == ScreenType.mobile ? SizedBox() : RightPane(),
                      ],
                    );
                  }(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
