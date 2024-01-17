import 'package:flutter_riverpod/flutter_riverpod.dart';

var hoverProvider = StateProvider<String>((ref) => "");

var scrollControlProvider = StateProvider<bool>((ref) => true);

var selectedExpProvider = StateProvider<int>((ref) => 0);

var progressProvider = StateProvider<bool>((ref) => false);

var gameScreenProvider = StateProvider<String?>((ref) => null);

var scoreProvider = StateProvider<int>((ref) => 0);

var scrollHandlerProvider = StateProvider<bool>((ref) => true);
