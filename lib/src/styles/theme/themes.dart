import 'package:ardrive_ui/ardrive_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';

class ArDriveApp extends StatefulWidget {
  const ArDriveApp({
    super.key,
    required this.builder,
    this.themeData,
  });
  final Widget Function(BuildContext context) builder;
  final ArDriveThemeData? themeData;

  @override
  State<ArDriveApp> createState() => _ArDriveAppState();
}

class _ArDriveAppState extends State<ArDriveApp> {
  @override
  Widget build(BuildContext context) {
    return ArDriveTheme(
      themeData: widget.themeData,
      child: Portal(
        child: Builder(builder: (context) {
          return widget.builder(context);
        }),
      ),
    );
  }
}

class ArDriveThemeData {
  ArDriveThemeData({
    Color? backgroundColor,
    Color? primaryColor,
    ArDriveToggleTheme? toggleTheme,
    ArDriveTableTheme? tableTheme,
    ThemeData? materialThemeData,
    String? name,
    ArDriveColors? colors,
    ArDriveShadows? shadows,
    ArDriveDropdownTheme? dropdownTheme,
  }) {
    this.colors = colors ?? ArDriveColors();
    this.shadows = shadows ?? ArDriveShadows(this.colors);

    this.toggleTheme = toggleTheme ??
        ArDriveToggleTheme(
          backgroundOffDisabled: this.colors.themeFgDisabled,
          backgroundOffColor: this.colors.themeFgDefault,
          backgroundOnColor: this.colors.themeFgDefault,
          indicatorColorDisabled: this.colors.themeFgOnDisabled,
          indicatorColorOff: this.colors.themeAccentDefault,
          indicatorColorOn: this.colors.themeAccentSubtle,
        );
    this.tableTheme = tableTheme ??
        ArDriveTableTheme(
          backgroundColor: const Color(0xff121212),
          cellColor: const Color(0xff191919),
        );
    this.dropdownTheme = dropdownTheme ??
        ArDriveDropdownTheme(
          backgroundColor: this.colors.themeBgSurface,
          hoverColor: const Color(0xff1D1D1D),
        );

    this.backgroundColor = backgroundColor ?? const Color(0xff010905);
    this.primaryColor = primaryColor ?? this.colors.themeAccentBrand;
    this.materialThemeData = materialThemeData ?? darkMaterialTheme();
    this.name = name ?? 'default';
  }

  late Color backgroundColor;
  late Color primaryColor;
  late ArDriveToggleTheme toggleTheme;
  late ArDriveTableTheme tableTheme;
  late ArDriveDropdownTheme dropdownTheme;
  late ThemeData materialThemeData;
  late String name;
  late ArDriveColors colors;
  late ArDriveShadows shadows;
}

ThemeData lightMaterialTheme() {
  final ThemeData theme = ThemeData.light();
  ArDriveColors colors = ArDriveColors.light();

  return ThemeData(
    fontFamily: 'Wavehaus',
    primaryColor: colors.themeAccentBrand,
    primaryColorLight: colors.themeAccentBrand,
    colorScheme: theme.colorScheme.copyWith(
      background: colors.themeBgSurface,
      primary: colors.themeAccentBrand,
      secondary: colors.themeAccentBrand,
      surface: colors.themeBgSurface,
      onSurface: colors.themeBgSurface,
    ),
    textTheme: theme.textTheme.apply(
      fontFamily: 'Wavehaus',
      bodyColor: colors.themeFgDefault,
    ),
  );
}

ArDriveThemeData lightTheme() {
  ArDriveColors colors = ArDriveColors.light();

  return ArDriveThemeData(
    backgroundColor: colors.themeBgSurface,
    colors: colors,
    tableTheme: ArDriveTableTheme(
      backgroundColor: const Color(0xffFAFAFA),
      cellColor: const Color(0xffF1EFF0),
    ),
    dropdownTheme: ArDriveDropdownTheme(
      backgroundColor: const Color(0xffFAFAFA),
      hoverColor: const Color(0xffF1EFF0),
    ),
    materialThemeData: lightMaterialTheme(),
    name: 'light',
  );
}

// ignore: must_be_immutable
class ArDriveTheme extends InheritedWidget {
  ArDriveTheme({
    ArDriveThemeData? themeData,
    required super.child,
    super.key,
  }) {
    this.themeData = themeData ?? ArDriveThemeData();
  }

  late ArDriveThemeData themeData;

  @override
  bool updateShouldNotify(ArDriveTheme oldWidget) =>
      themeData != oldWidget.themeData;
  static ArDriveTheme of(BuildContext context) {
    final theme = context.dependOnInheritedWidgetOfExactType<ArDriveTheme>();

    if (theme != null) {
      return theme;
    }

    throw Exception('Not found a ArDriveTheme in the widget tree');
  }
}

class ArDriveToggleTheme {
  ArDriveToggleTheme({
    required this.indicatorColorOn,
    required this.indicatorColorOff,
    required this.indicatorColorDisabled,
    required this.backgroundOnColor,
    required this.backgroundOffColor,
    required this.backgroundOffDisabled,
  });

  final Color indicatorColorOn;
  final Color indicatorColorOff;
  final Color indicatorColorDisabled;
  final Color backgroundOnColor;
  final Color backgroundOffColor;
  final Color backgroundOffDisabled;
}

class ArDriveTableTheme {
  ArDriveTableTheme({
    required this.backgroundColor,
    required this.cellColor,
  });

  final Color backgroundColor;
  final Color cellColor;
}

class ArDriveDropdownTheme {
  ArDriveDropdownTheme({
    required this.backgroundColor,
    required this.hoverColor,
  });

  final Color backgroundColor;
  final Color hoverColor;
}

ThemeData darkMaterialTheme() {
  final ThemeData theme = ThemeData.dark();
  ArDriveColors colors = ArDriveColors.dark();

  return ThemeData(
    fontFamily: 'Wavehaus',
    primaryColor: colors.themeAccentBrand,
    primaryColorLight: colors.themeAccentBrand,
    colorScheme: theme.colorScheme.copyWith(
      background: colors.themeBgSurface,
      primary: colors.themeAccentBrand,
      secondary: colors.themeAccentBrand,
      surface: colors.themeBgSurface,
      onSurface: colors.themeBgSurface,
    ),
    textTheme: theme.textTheme.apply(
      fontFamily: 'Wavehaus',
      bodyColor: colors.themeFgDefault,
    ),
  );
}
