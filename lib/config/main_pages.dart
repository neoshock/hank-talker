import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/features/home/pages/home_page.dart';
import 'package:hank_talker_mobile/features/profile/pages/profile_page.dart';

final List<Widget> mainPages = [
  const HomePage(),
  const Center(
    child: Text('Cart'),
  ),
  ProfilePage(),
];
