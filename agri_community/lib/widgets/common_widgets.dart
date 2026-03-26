import 'package:flutter/material.dart';
import '../theme.dart';

/// Section header with optional subtitle
class SectionHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? trailing;

  const SectionHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                  letterSpacing: 0.1,
                ),
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 2),
                Text(
                  subtitle!,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ],
          ),
        ),
        if (trailing != null) trailing!,
      ],
    );
  }
}

/// Tag/badge chip
class TagChip extends StatelessWidget {
  final String label;
  final Color? bgColor;
  final Color? textColor;

  const TagChip({
    super.key,
    required this.label,
    this.bgColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    Color bg = bgColor ?? AppColors.tagBg;
    Color fg = textColor ?? AppColors.tagText;

    // Color-code by type
    switch (label) {
      case 'Urgent':
        bg = const Color(0xFFFFEBEB);
        fg = AppColors.errorRed;
        break;
      case 'Disease':
      case 'Fungal':
        bg = const Color(0xFFFFF3E0);
        fg = const Color(0xFFB05A00);
        break;
      case 'Watering':
        bg = const Color(0xFFE3F2FD);
        fg = const Color(0xFF1565C0);
        break;
      case 'Tip':
        bg = AppColors.tagBg;
        fg = AppColors.tagText;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: fg,
          letterSpacing: 0.3,
        ),
      ),
    );
  }
}

/// Status dot indicator
class StatusIndicator extends StatelessWidget {
  final String status;
  final String colorCode;

  const StatusIndicator({
    super.key,
    required this.status,
    required this.colorCode,
  });

  Color get _color {
    switch (colorCode) {
      case 'good':
        return AppColors.primaryLight;
      case 'warn':
        return AppColors.warningYellow;
      case 'bad':
        return AppColors.errorRed;
      default:
        return AppColors.textSecondary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 7,
          height: 7,
          decoration: BoxDecoration(
            color: _color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          status,
          style: TextStyle(
            fontSize: 12,
            color: colorCode == 'good'
                ? AppColors.primary
                : colorCode == 'warn'
                    ? const Color(0xFF8A6500)
                    : AppColors.errorRed,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

/// Emoji avatar circle
class EmojiAvatar extends StatelessWidget {
  final String emoji;
  final double size;
  final Color? bgColor;

  const EmojiAvatar({
    super.key,
    required this.emoji,
    this.size = 44,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: bgColor ?? AppColors.tagBg,
        borderRadius: BorderRadius.circular(size * 0.3),
      ),
      child: Center(
        child: Text(emoji, style: TextStyle(fontSize: size * 0.45)),
      ),
    );
  }
}

/// Primary action button full-width
class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final String? leadingEmoji;

  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.leadingEmoji,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (leadingEmoji != null) ...[
              Text(leadingEmoji!, style: const TextStyle(fontSize: 16)),
              const SizedBox(width: 8),
            ],
            Text(label),
          ],
        ),
      ),
    );
  }
}

/// Secondary outlined button full-width
class SecondaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final String? leadingEmoji;

  const SecondaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.leadingEmoji,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (leadingEmoji != null) ...[
              Text(leadingEmoji!, style: const TextStyle(fontSize: 16)),
              const SizedBox(width: 8),
            ],
            Text(label),
          ],
        ),
      ),
    );
  }
}

/// Info row with label and value
class InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final bool highlight;

  const InfoRow({
    super.key,
    required this.label,
    required this.value,
    this.highlight = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color:
                    highlight ? AppColors.primary : AppColors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}