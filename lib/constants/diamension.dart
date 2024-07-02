

import 'dart:ui';

import 'package:flutter/material.dart';

FlutterView view = WidgetsBinding.instance.platformDispatcher.views.first;


Size size = view.physicalSize;
double width = size.width;
double height = size.height;