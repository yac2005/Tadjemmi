import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'theme.dart';
import 'screens/feed_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const AgriCommunityApp());
}

class AgriCommunityApp extends StatelessWidget {
  const AgriCommunityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AgriCommunity',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: const FeedScreen(),
    );
  }
}