import 'package:aci_planner/shared/network/network_controle.dart';
import 'package:aci_planner/shared/widget/corner_back_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:aci_planner/shared/data/constants.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          SizedBox.expand(
            child: Image.asset('assets/aci_home_bg.png', fit: BoxFit.cover),
          ),

          // Dark overlay
          Container(color: Colors.black.withValues(alpha: 0.5)),

          // Game-style corner back button
          Positioned(
            top: 0,
            left: 0,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: CustomPaint(
                painter: CornerBackButtonPainter(),
                child: SizedBox(
                  width: 100,
                  height: 50,
                  child: Center(
                    child: Icon(
                      Icons.subdirectory_arrow_left,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // About content - scrollable
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 130, vertical: 0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 100),
                  Text(
                    'ACI Planner',
                    style: TextStyle(
                      color: AppCustomColors.text,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),

                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      style: TextStyle(
                        color: AppCustomColors.text.withValues(alpha: 0.9),
                        fontSize: 18,
                        height: 1.6,
                      ),
                      children: [
                        const TextSpan(
                          text:
                              'Hey there! Welcome to ACI Planner, your handy little tool to make factory planning in Arknights: Endfield way easier. '
                              'Here, you can save and manage your resources, check exactly what materials you need for each factory, '
                              'and even plan future factory layouts without messing anything up in-game.\n\n'
                              'Just to be clear: this is NOT a game itself. It’s a planning assistant. '
                              'Some factory names and views had to be tweaked due to licensing, but don’t worry, '
                              'all the essentials are here to help you plan like a pro.\n\n'
                              'I really hope this app makes your life easier and lets you experiment with your factory layouts stress-free. '
                              'Join our ',
                        ),
                        TextSpan(
                          text: 'Discord',
                          style: const TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              NetworkControl.openDiscord();
                            },
                        ),
                        const TextSpan(
                          text:
                              ' community for quick updates, bug reports, and to share your ideas. We love hearing from you!\n\n'
                              'If you enjoy the app and want to help me stay sane during those late-night coding sessions, consider buying me a ',
                        ),
                        TextSpan(
                          text: 'coffee',
                          style: const TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              NetworkControl.openCoffee();
                            },
                        ),
                        const TextSpan(
                          text: ' ☕. It really helps keep the dev energy alive!',
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 42),
                  Text(
                    'Version 1.0.0',
                    style: TextStyle(
                      color: AppCustomColors.text.withValues(alpha: 0.6),
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.left,
                  ),

                  // Clickable links
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => NetworkControl.openDiscord(),
                        child: Text(
                          'Discord',
                          style: TextStyle(
                            color: AppCustomColors.text.withValues(alpha: 0.8),
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      Text(
                        ' | ',
                        style: TextStyle(
                          color: AppCustomColors.text.withValues(alpha: 0.6),
                          fontSize: 16,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => NetworkControl.openCoffee(),
                        child: Text(
                          'Coffee',
                          style: TextStyle(
                            color: AppCustomColors.text.withValues(alpha: 0.8),
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),

                  Text(
                    'Developed by WOLFEX',
                    style: TextStyle(
                      color: AppCustomColors.text.withValues(alpha: 0.6),
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
