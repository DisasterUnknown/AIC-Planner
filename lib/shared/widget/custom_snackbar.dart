import 'package:flutter/material.dart';

void showDarkStatusSnackBar({
  required BuildContext context,
  required String message,
  IconData? icon,
  Color? color,
  Duration duration = const Duration(seconds: 2),
}) {
  final overlay = Overlay.of(context);

  final entry = OverlayEntry(
    builder: (_) => Positioned(
      top: 50,
      left: 16,
      right: 16,
      child: _DarkSnackBarWidget(
        message: message,
        icon: icon,
        color: color ?? Colors.white,
      ),
    ),
  );

  overlay.insert(entry);

  Future.delayed(duration, () {
    entry.remove();
  });
}

class _DarkSnackBarWidget extends StatefulWidget {
  final String message;
  final IconData? icon;
  final Color color;

  const _DarkSnackBarWidget({
    required this.message,
    this.icon,
    required this.color,
  });

  @override
  State<_DarkSnackBarWidget> createState() => _DarkSnackBarWidgetState();
}

class _DarkSnackBarWidgetState extends State<_DarkSnackBarWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: Material(
        color: Colors.transparent,
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.85),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: widget.color.withValues(alpha: 0.4)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.5),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.icon != null)
                  Icon(widget.icon, color: widget.color, size: 20),
                if (widget.icon != null) const SizedBox(width: 10),
                Flexible(
                  child: Text(
                    widget.message,
                    style: TextStyle(
                      color: widget.color,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
