import 'package:credix_app/core/ui/theme/theme.dart';
import 'package:credix_app/core/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          const Positioned(
            top: 96,
            right: -123,
            child: BlurredGlowCircle(size: 220, color: Color(0xFFFFE9C8)),
          ),
          const Positioned(
            bottom: -96,
            right: 73,
            child: BlurredGlowCircle(size: 220, color: Color(0xFFFFF4C8)),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
              child: SingleChildScrollView(
                physics: const  BouncingScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
                  ),
                  child: IntrinsicHeight(
                    child: child,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
