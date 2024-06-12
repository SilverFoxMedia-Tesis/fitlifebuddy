import 'dart:async';

import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/font/font_size.dart';
import 'package:fitlifebuddy/core/theme/size/container_size.dart';
import 'package:fitlifebuddy/core/theme/style/border_radius.dart';
import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:fitlifebuddy/widgets/banner/tips.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBanner extends StatefulWidget {
  const AppBanner({super.key});

  @override
  State<AppBanner> createState() => _AppBannerState();
}

class _AppBannerState extends State<AppBanner> with TickerProviderStateMixin  {
  late final AnimationController _hoverController;
  late final Animation<Color?> _hoverColorAnimation;
  late final AnimationController _cycleController;
  late final Animation<Color?> _cycleColorAnimation;
  var _mousePosition = Offset.zero;
  var _isHovering = false;

  var _currentTipIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _hoverController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _hoverColorAnimation = ColorTween(
      begin: AppColors.secondary,
      end: AppColors.tertiary,
    ).animate(_hoverController);
    _cycleController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
    _cycleColorAnimation = ColorTween(
      begin: AppColors.secondary,
      end: AppColors.tertiary,
    ).animate(_cycleController);

    _startTimer();
  }

  @override
  void dispose() {
    _hoverController.dispose();
    _cycleController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _updateMousePosition(PointerEvent event) {
    setState(() {
      _mousePosition = event.position;
      _hoverController.value = _mousePosition.dx / context.size!.width;
      _isHovering = true;
    });
  }

  void _handleHoverExit() {
    setState(() {
      _isHovering = false;
      _hoverController.stop();
    });
  }

    void _startTimer() {
    _timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      setState(() {
        _currentTipIndex = (_currentTipIndex + 1) % tips.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => _updateMousePosition(event),
      onExit: (event) => _handleHoverExit(),
      child: AnimatedBuilder(
        animation: _isHovering ? _hoverColorAnimation : _cycleColorAnimation,
        builder: (context, child) {
          return Container(
            height: ContainerSize.bannerHeight,
            padding: AppPadding.padding16,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  _isHovering
                      ? Color.lerp(AppColors.secondary, AppColors.tertiary, _hoverController.value)!
                      : _cycleColorAnimation.value ?? AppColors.secondary,
                  AppColors.primary,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: AppBorderRadius.borderRadius14,
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: ContainerSize.tipContainerWidth),
              child: Text(
                '“${tips[_currentTipIndex]}”',
                style: GoogleFonts.kalam(
                  fontSize: AppFontSize.fontSize24,
                  color: AppColors.light,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      ),
    );
  }
}