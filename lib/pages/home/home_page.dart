import 'package:aic_planner/pages/home/widget/cornerIcon_button.dart';
import 'package:aic_planner/pages/home/widget/main_button.dart';
import 'package:aic_planner/shared/network/network_controle.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Remove backgroundColor since we'll use an image
      body: Stack(
        children: [
          // ===== BACKGROUND IMAGE =====
          SizedBox.expand(
            child: Image.asset(
              'assets/aci_home_bg.png',
              fit: BoxFit.cover,
            ),
          ),

          // Optional: dark overlay for readability
          Container(
            color: Colors.black.withValues(alpha: 0.4),
          ),

          // ===== MAIN BUTTONS =====
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildMainButton(
                  title: 'New Pallet',
                  icon: Icons.add_box_outlined,
                  color: const Color(0xB3717171),
                  onTap: () {
                    Navigator.pushNamed(context, '/aic_planner');
                  },
                ),
                const SizedBox(height: 24),
                buildMainButton(
                  title: 'Save AIC',
                  icon: Icons.save_outlined,
                  color: const Color(0xB3717171),
                  onTap: () {
                    Navigator.pushNamed(context, '/save_slot');
                  },
                ),
                const SizedBox(height: 24),
                buildMainButton(
                  title: 'About',
                  icon: Icons.info_outline,
                  color: const Color(0xB3717171),
                  onTap: () {
                    Navigator.pushNamed(context, '/about');
                  },
                ),
              ],
            ),
          ),

          // ===== CORNER ICON BUTTONS =====
          // Settings top-left
          Positioned(
            top: 24,
            left: 24,
            child: buildCornerIconButton(
              icon: Icons.settings,
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
          ),

          // Coffee bottum-right
          Positioned(
            bottom: 24,
            right: 85,
            child: buildCornerIconButton(
              icon: Icons.coffee,
              onTap: () {
                NetworkControl.openCoffee();
              },
            ),
          ),

          // Discord bottom-right
          Positioned(
            bottom: 24,
            right: 24,
            child: buildCornerIconButton(
              icon: Icons.discord,
              onTap: () {
                NetworkControl.openDiscord();
              },
            ),
          ),
        ],
      ),
    );
  }
}
