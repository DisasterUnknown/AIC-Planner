import 'package:aci_planner/shared/widget/corner_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/save_slot_bloc.dart';
import 'bloc/save_slot_event.dart';
import 'bloc/save_slot_state.dart';
import 'widget/save_slot_card.dart';
import 'package:aci_planner/shared/data/constants.dart';

class SaveSlotPage extends StatelessWidget {
  const SaveSlotPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SaveSlotBloc()..add(LoadSaveSlots()),
      child: Scaffold(
        backgroundColor: AppCustomColors.background,
        body: Stack(
          children: [
            // Background image
            SizedBox.expand(
              child: Image.asset('assets/aci_home_bg.png', fit: BoxFit.cover),
            ),

            // Dark overlay
            Container(color: Colors.black.withValues(alpha: 0.55)),

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

            // Content
            Center(
              child: BlocConsumer<SaveSlotBloc, SaveSlotState>(
                listener: (context, state) {
                  // Future use:
                  // - navigate to editor
                  // - show locked dialog
                  // - show snackbar
                },
                builder: (context, state) {
                  return SizedBox(
                    height: 320, 
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 48),
                      itemCount: state.slots.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 24),
                      itemBuilder: (context, index) {
                        final slot = state.slots[index];
                        return SaveSlotCard(
                          slot: slot,
                          onTap: () {
                            context.read<SaveSlotBloc>().add(
                              SelectSaveSlot(slot.index),
                            );
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
