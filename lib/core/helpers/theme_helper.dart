import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Helper methods for theme-related operations
class ThemeHelper {
  /// Check if the current theme is dark mode
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  /// Get card background color based on theme
  static Color getCardColor(BuildContext context) {
    return isDarkMode(context) ? AppTheme.darkSurface : AppTheme.lightGrey;
  }

  /// Get surface color based on theme (for containers)
  static Color getSurfaceColor(BuildContext context) {
    return isDarkMode(context) ? AppTheme.darkSurface : Colors.white;
  }

  /// Get text color based on theme
  static Color getTextColor(BuildContext context) {
    return Theme.of(context).colorScheme.onSurface;
  }

  /// Get border color with opacity based on theme
  static Color getBorderColor(BuildContext context, {double opacity = 0.2}) {
    return Colors.grey.withOpacity(opacity);
  }
}
