import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4286467452),
      surfaceTint: Color(4286467452),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4294956792),
      onPrimaryContainer: Color(4281534516),
      secondary: Color(4285356138),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4294368240),
      onSecondaryContainer: Color(4280686117),
      tertiary: Color(4286730823),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4294957778),
      onTertiaryContainer: Color(4281536777),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294965242),
      onSurface: Color(4280293918),
      onSurfaceVariant: Color(4283319371),
      outline: Color(4286542972),
      outlineVariant: Color(4291937228),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281675315),
      inversePrimary: Color(4293899497),
      primaryFixed: Color(4294956792),
      onPrimaryFixed: Color(4281534516),
      primaryFixedDim: Color(4293899497),
      onPrimaryFixedVariant: Color(4284757603),
      secondaryFixed: Color(4294368240),
      onSecondaryFixed: Color(4280686117),
      secondaryFixedDim: Color(4292460499),
      onSecondaryFixedVariant: Color(4283711825),
      tertiaryFixed: Color(4294957778),
      onTertiaryFixed: Color(4281536777),
      tertiaryFixedDim: Color(4294359209),
      onTertiaryFixedVariant: Color(4284889905),
      surfaceDim: Color(4293056477),
      surfaceBright: Color(4294965242),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294832375),
      surfaceContainer: Color(4294437873),
      surfaceContainerHigh: Color(4294043115),
      surfaceContainerHighest: Color(4293648358),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4284428894),
      surfaceTint: Color(4286467452),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4288045971),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4283448653),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4286869120),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4284626989),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4288374876),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294965242),
      onSurface: Color(4280293918),
      onSurfaceVariant: Color(4282990663),
      outline: Color(4284963940),
      outlineVariant: Color(4286805888),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281675315),
      inversePrimary: Color(4293899497),
      primaryFixed: Color(4288045971),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4286270329),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4286869120),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4285159015),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4288374876),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4286533701),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4293056477),
      surfaceBright: Color(4294965242),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294832375),
      surfaceContainer: Color(4294437873),
      surfaceContainerHigh: Color(4294043115),
      surfaceContainerHighest: Color(4293648358),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4281995323),
      surfaceTint: Color(4286467452),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4284428894),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4281146668),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4283448653),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4282062863),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4284626989),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294965242),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4280951080),
      outline: Color(4282990663),
      outlineVariant: Color(4282990663),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281675315),
      inversePrimary: Color(4294960376),
      primaryFixed: Color(4284428894),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4282784839),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4283448653),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4281870135),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4284626989),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4282917401),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4293056477),
      surfaceBright: Color(4294965242),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294832375),
      surfaceContainer: Color(4294437873),
      surfaceContainerHigh: Color(4294043115),
      surfaceContainerHighest: Color(4293648358),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4293899497),
      surfaceTint: Color(4293899497),
      onPrimary: Color(4283113291),
      primaryContainer: Color(4284757603),
      onPrimaryContainer: Color(4294956792),
      secondary: Color(4292460499),
      onSecondary: Color(4282133306),
      secondaryContainer: Color(4283711825),
      onSecondaryContainer: Color(4294368240),
      tertiary: Color(4294359209),
      onTertiary: Color(4283180572),
      tertiaryContainer: Color(4284889905),
      onTertiaryContainer: Color(4294957778),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279702038),
      onSurface: Color(4293648358),
      onSurfaceVariant: Color(4291937228),
      outline: Color(4288318870),
      outlineVariant: Color(4283319371),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293648358),
      inversePrimary: Color(4286467452),
      primaryFixed: Color(4294956792),
      onPrimaryFixed: Color(4281534516),
      primaryFixedDim: Color(4293899497),
      onPrimaryFixedVariant: Color(4284757603),
      secondaryFixed: Color(4294368240),
      onSecondaryFixed: Color(4280686117),
      secondaryFixedDim: Color(4292460499),
      onSecondaryFixedVariant: Color(4283711825),
      tertiaryFixed: Color(4294957778),
      onTertiaryFixed: Color(4281536777),
      tertiaryFixedDim: Color(4294359209),
      onTertiaryFixedVariant: Color(4284889905),
      surfaceDim: Color(4279702038),
      surfaceBright: Color(4282267452),
      surfaceContainerLowest: Color(4279373073),
      surfaceContainerLow: Color(4280293918),
      surfaceContainer: Color(4280557091),
      surfaceContainerHigh: Color(4281215021),
      surfaceContainerHighest: Color(4282004280),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294162669),
      surfaceTint: Color(4293899497),
      onPrimary: Color(4281074479),
      primaryContainer: Color(4290084785),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4292723672),
      onSecondary: Color(4280291615),
      secondaryContainer: Color(4288776861),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294622381),
      onTertiary: Color(4281076741),
      tertiaryContainer: Color(4290413430),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279702038),
      onSurface: Color(4294965754),
      onSurfaceVariant: Color(4292200400),
      outline: Color(4289503144),
      outlineVariant: Color(4287398024),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293648358),
      inversePrimary: Color(4284823396),
      primaryFixed: Color(4294956792),
      onPrimaryFixed: Color(4280680488),
      primaryFixedDim: Color(4293899497),
      onPrimaryFixedVariant: Color(4283508049),
      secondaryFixed: Color(4294368240),
      onSecondaryFixed: Color(4279962650),
      secondaryFixedDim: Color(4292460499),
      onSecondaryFixedVariant: Color(4282527808),
      tertiaryFixed: Color(4294957778),
      onTertiaryFixed: Color(4280616707),
      tertiaryFixedDim: Color(4294359209),
      onTertiaryFixedVariant: Color(4283640610),
      surfaceDim: Color(4279702038),
      surfaceBright: Color(4282267452),
      surfaceContainerLowest: Color(4279373073),
      surfaceContainerLow: Color(4280293918),
      surfaceContainer: Color(4280557091),
      surfaceContainerHigh: Color(4281215021),
      surfaceContainerHighest: Color(4282004280),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294965754),
      surfaceTint: Color(4293899497),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4294162669),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294965754),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4292723672),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294965752),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4294622381),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279702038),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294965754),
      outline: Color(4292200400),
      outlineVariant: Color(4292200400),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293648358),
      inversePrimary: Color(4282587460),
      primaryFixed: Color(4294958584),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4294162669),
      onPrimaryFixedVariant: Color(4281074479),
      secondaryFixed: Color(4294696948),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4292723672),
      onSecondaryFixedVariant: Color(4280291615),
      tertiaryFixed: Color(4294959321),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4294622381),
      onTertiaryFixedVariant: Color(4281076741),
      surfaceDim: Color(4279702038),
      surfaceBright: Color(4282267452),
      surfaceContainerLowest: Color(4279373073),
      surfaceContainerLow: Color(4280293918),
      surfaceContainer: Color(4280557091),
      surfaceContainerHigh: Color(4281215021),
      surfaceContainerHighest: Color(4282004280),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
