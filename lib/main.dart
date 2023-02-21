import 'package:flutter/material.dart';

import 'data.dart';
import 'home.dart';

void main()
{
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => home(),
        'data':(context) => data(),

      },
    ),
  );
}