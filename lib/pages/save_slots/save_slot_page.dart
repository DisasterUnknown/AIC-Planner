import 'package:aic_planner/pages/save_slots/widget/show_load_save_slot_dialog.dart';
import 'package:aic_planner/shared/widget/corner_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/save_slot_bloc.dart';
import 'bloc/save_slot_event.dart';
import 'bloc/save_slot_state.dart';
import 'widget/save_slot_card.dart';
import 'package:aic_planner/shared/data/constants.dart';

class SaveSlotPage extends StatelessWidget {
  const SaveSlotPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SaveSlotBloc()..add(InitSaveSlots()),
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
            cornerBackBtn(context),

            // Content
            Center(
              child: BlocConsumer<SaveSlotBloc, SaveSlotState>(
                listener: (context, state) {
                  if (state is SaveSlotSelectedState) {
                    showLoadSaveSlotDialog(
                      context,
                      slot: state.slots[state.selectedIndex],
                      onLoad: () {
                        context.read<SaveSlotBloc>().add(LoadSaveSlot());
                      },
                      onShare: () {
                        
                      },
                      onDelete: () {},
                    );
                  }

                  if (state is SaveSlotLoadState) {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/aic_planner');
                  }
                },
                builder: (context, state) {
                  // Handle loading / empty gracefully
                  if (state is SaveSlotInitialState) {
                    return const CircularProgressIndicator();
                  }

                  final slots = state.slots;

                  if (slots.isEmpty) {
                    return const Text(
                      'No saves yet',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    );
                  }

                  return SizedBox(
                    height: 320,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 48),
                      itemCount: slots.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 24),
                      itemBuilder: (context, index) {
                        final slot = slots[index];

                        return SaveSlotCard(
                          slot: slot,
                          onTap: () {
                            context.read<SaveSlotBloc>().add(
                              SelectSaveSlot(index),
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
