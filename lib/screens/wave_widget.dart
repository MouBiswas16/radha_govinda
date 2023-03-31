// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, override_on_non_overriding_member, must_call_super, unused_local_variable, prefer_const_declarations

import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../widgets/clipper_widget.dart';

class WaveWidget extends StatefulWidget {
  final Size? size;
  final double? yOffset;
  final Color? color;
  WaveWidget({
    this.size,
    this.yOffset,
    this.color,
  });

  @override
  State<WaveWidget> createState() => _WaveWidgetState();
}

class _WaveWidgetState extends State<WaveWidget> with TickerProviderStateMixin {
  late AnimationController animationController;
  List<Offset> wavePoints = [];

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 5000))
      ..addListener(() {
        wavePoints.clear();
        final double wavespeed = animationController.value * 1080;
        final double fullSphere = animationController.value * math.pi * 2;
        final double normalizer = math.cos(fullSphere);
        final double waveWidth = math.pi / 270;
        final double waveHeight = 20.0;

        for (int i = 0; i <= widget.size!.width.toInt(); ++i) {
          double calc = math.sin(wavespeed - i) * waveWidth;
          wavePoints.add(
            Offset(
              i.toDouble(),
              calc * waveHeight * normalizer + widget.yOffset!.toDouble(),
            ),
          );
        }
      });
    animationController.repeat();
  }

  @override
  void disose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, _) {
        return ClipPath(
          clipper: ClipperWidget(wavePoints),
          child: Container(
            width: widget.size!.width,
            height: widget.size!.height,
            color: widget.color,
          ),
        );
      },
    );
  }
}
