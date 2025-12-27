import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

/// Enhanced gradient button with multiple styles and animations
class GradientButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;
  final Gradient? gradient;
  final double? width;
  final double? height;
  final bool isLoading;
  final bool isOutlined;
  final Color? textColor;
  final double borderRadius;
  final List<BoxShadow>? boxShadow;

  const GradientButton({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
    this.gradient,
    this.width,
    this.height,
    this.isLoading = false,
    this.isOutlined = false,
    this.textColor,
    this.borderRadius = 12,
    this.boxShadow,
  });

  @override
  State<GradientButton> createState() => _GradientButtonState();
}

class _GradientButtonState extends State<GradientButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    setState(() => _isPressed = true);
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    setState(() => _isPressed = false);
    _controller.reverse();
  }

  void _onTapCancel() {
    setState(() => _isPressed = false);
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final gradient = widget.gradient ?? AppColors.primaryGradient;
    final isEnabled = widget.onPressed != null && !widget.isLoading;

    return GestureDetector(
      onTapDown: isEnabled ? _onTapDown : null,
      onTapUp: isEnabled ? _onTapUp : null,
      onTapCancel: isEnabled ? _onTapCancel : null,
      onTap: isEnabled ? widget.onPressed : null,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: widget.width,
          height: widget.height ?? 56,
          decoration: BoxDecoration(
            gradient: widget.isOutlined ? null : gradient,
            border: widget.isOutlined
                ? Border.all(
                    color: AppColors.primary,
                    width: 2,
                  )
                : null,
            borderRadius: BorderRadius.circular(widget.borderRadius),
            boxShadow: widget.isOutlined
                ? null
                : (widget.boxShadow ??
                    (_isPressed
                        ? AppColors.shadowSmall
                        : AppColors.shadowMedium)),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: isEnabled ? widget.onPressed : null,
              borderRadius: BorderRadius.circular(widget.borderRadius),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: widget.isLoading
                    ? Center(
                        child: SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              widget.textColor ?? Colors.white,
                            ),
                          ),
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (widget.icon != null) ...[
                            Icon(
                              widget.icon,
                              color: widget.isOutlined
                                  ? AppColors.primary
                                  : (widget.textColor ?? Colors.white),
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                          ],
                          Text(
                            widget.text,
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: widget.isOutlined
                                  ? AppColors.primary
                                  : (widget.textColor ?? Colors.white),
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
