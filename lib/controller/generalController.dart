import 'package:flutter_riverpod/flutter_riverpod.dart';

var hoverProvider = StateProvider<String>((ref) => "");

var scrollControlProvider = StateProvider<bool>((ref) => true);

var selectedExpProvider = StateProvider<int>((ref) => 0);
