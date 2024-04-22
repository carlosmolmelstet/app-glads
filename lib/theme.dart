import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff226487),
      surfaceTint: Color(0xff226487),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffc7e7ff),
      onPrimaryContainer: Color(0xff001e2e),
      secondary: Color(0xff904b3e),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffffdad4),
      onSecondaryContainer: Color(0xff3a0a04),
      tertiary: Color(0xff116b57),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffa3f2d8),
      onTertiaryContainer: Color(0xff002018),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      background: Color(0xfff6fafe),
      onBackground: Color(0xff181c20),
      surface: Color(0xfff6fafe),
      onSurface: Color(0xff181c20),
      surfaceVariant: Color(0xffdde3ea),
      onSurfaceVariant: Color(0xff41484d),
      outline: Color(0xff71787e),
      outlineVariant: Color(0xffc1c7ce),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d3135),
      inverseOnSurface: Color(0xffeef1f6),
      inversePrimary: Color(0xff92cef6),
      primaryFixed: Color(0xffc7e7ff),
      onPrimaryFixed: Color(0xff001e2e),
      primaryFixedDim: Color(0xff92cef6),
      onPrimaryFixedVariant: Color(0xff004c6c),
      secondaryFixed: Color(0xffffdad4),
      onSecondaryFixed: Color(0xff3a0a04),
      secondaryFixedDim: Color(0xffffb4a6),
      onSecondaryFixedVariant: Color(0xff733429),
      tertiaryFixed: Color(0xffa3f2d8),
      onTertiaryFixed: Color(0xff002018),
      tertiaryFixedDim: Color(0xff87d6bd),
      onTertiaryFixedVariant: Color(0xff005140),
      surfaceDim: Color(0xffd7dadf),
      surfaceBright: Color(0xfff6fafe),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff1f4f9),
      surfaceContainer: Color(0xffebeef3),
      surfaceContainerHigh: Color(0xffe5e8ed),
      surfaceContainerHighest: Color(0xffdfe3e7),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4278208614),
      surfaceTint: Color(4280444039),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4282219423),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4285411365),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4289355858),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278209597),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4281434732),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      background: Color(4294376190),
      onBackground: Color(4279770144),
      surface: Color(4294376190),
      onSurface: Color(4279770144),
      surfaceVariant: Color(4292731882),
      onSurfaceVariant: Color(4282205257),
      outline: Color(4284047462),
      outlineVariant: Color(4285889409),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281151797),
      inverseOnSurface: Color(4293849590),
      inversePrimary: Color(4287811318),
      primaryFixed: Color(4282219423),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4280181381),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4289355858),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4287449148),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4281434732),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4278937684),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292336351),
      surfaceBright: Color(4294376190),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294046969),
      surfaceContainer: Color(4293652211),
      surfaceContainerHigh: Color(4293257453),
      surfaceContainerHighest: Color(4292862951),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4278199607),
      surfaceTint: Color(4280444039),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4278208614),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4282585096),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4285411365),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278200351),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4278209597),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      background: Color(4294376190),
      onBackground: Color(4279770144),
      surface: Color(4294376190),
      onSurface: Color(4278190080),
      surfaceVariant: Color(4292731882),
      onSurfaceVariant: Color(4280165674),
      outline: Color(4282205257),
      outlineVariant: Color(4282205257),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281151797),
      inverseOnSurface: Color(4294967295),
      inversePrimary: Color(4292603903),
      primaryFixed: Color(4278208614),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278202438),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4285411365),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4283505425),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4278209597),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4278203432),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292336351),
      surfaceBright: Color(4294376190),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294046969),
      surfaceContainer: Color(4293652211),
      surfaceContainerHigh: Color(4293257453),
      surfaceContainerHighest: Color(4292862951),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4287811318),
      surfaceTint: Color(4287811318),
      onPrimary: Color(4278203468),
      primaryContainer: Color(4278209644),
      onPrimaryContainer: Color(4291291135),
      secondary: Color(4294948006),
      onSecondary: Color(4283833877),
      secondaryContainer: Color(4285740073),
      onSecondaryContainer: Color(4294957780),
      tertiary: Color(4287092413),
      onTertiary: Color(4278204460),
      tertiaryContainer: Color(4278210880),
      onTertiaryContainer: Color(4288934616),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      background: Color(4279243799),
      onBackground: Color(4292862951),
      surface: Color(4279243799),
      onSurface: Color(4292862951),
      surfaceVariant: Color(4282468429),
      onSurfaceVariant: Color(4290889678),
      outline: Color(4287336856),
      outlineVariant: Color(4282468429),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292862951),
      inverseOnSurface: Color(4281151797),
      inversePrimary: Color(4280444039),
      primaryFixed: Color(4291291135),
      onPrimaryFixed: Color(4278197806),
      primaryFixedDim: Color(4287811318),
      onPrimaryFixedVariant: Color(4278209644),
      secondaryFixed: Color(4294957780),
      onSecondaryFixed: Color(4281993732),
      secondaryFixedDim: Color(4294948006),
      onSecondaryFixedVariant: Color(4285740073),
      tertiaryFixed: Color(4288934616),
      onTertiaryFixed: Color(4278198296),
      tertiaryFixedDim: Color(4287092413),
      onTertiaryFixedVariant: Color(4278210880),
      surfaceDim: Color(4279243799),
      surfaceBright: Color(4281678397),
      surfaceContainerLowest: Color(4278849298),
      surfaceContainerLow: Color(4279770144),
      surfaceContainer: Color(4280033316),
      surfaceContainerHigh: Color(4280691246),
      surfaceContainerHighest: Color(4281414969),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4288140026),
      surfaceTint: Color(4287811318),
      onPrimary: Color(4278196262),
      primaryContainer: Color(4284258237),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294949549),
      onSecondary: Color(4281533698),
      secondaryContainer: Color(4291591020),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4287355585),
      onTertiary: Color(4278197012),
      tertiaryContainer: Color(4283473800),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      background: Color(4279243799),
      onBackground: Color(4292862951),
      surface: Color(4279243799),
      onSurface: Color(4294507519),
      surfaceVariant: Color(4282468429),
      onSurfaceVariant: Color(4291152850),
      outline: Color(4288521386),
      outlineVariant: Color(4286416010),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292862951),
      inverseOnSurface: Color(4280691502),
      inversePrimary: Color(4278209902),
      primaryFixed: Color(4291291135),
      onPrimaryFixed: Color(4278194975),
      primaryFixedDim: Color(4287811318),
      onPrimaryFixedVariant: Color(4278205012),
      secondaryFixed: Color(4294957780),
      onSecondaryFixed: Color(4281074176),
      secondaryFixedDim: Color(4294948006),
      onSecondaryFixedVariant: Color(4284359706),
      tertiaryFixed: Color(4288934616),
      onTertiaryFixed: Color(4278195471),
      tertiaryFixedDim: Color(4287092413),
      onTertiaryFixedVariant: Color(4278206001),
      surfaceDim: Color(4279243799),
      surfaceBright: Color(4281678397),
      surfaceContainerLowest: Color(4278849298),
      surfaceContainerLow: Color(4279770144),
      surfaceContainer: Color(4280033316),
      surfaceContainerHigh: Color(4280691246),
      surfaceContainerHighest: Color(4281414969),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4294507519),
      surfaceTint: Color(4287811318),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4288140026),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294965752),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4294949549),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4293722102),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4287355585),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      background: Color(4279243799),
      onBackground: Color(4292862951),
      surface: Color(4279243799),
      onSurface: Color(4294967295),
      surfaceVariant: Color(4282468429),
      onSurfaceVariant: Color(4294507519),
      outline: Color(4291152850),
      outlineVariant: Color(4291152850),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292862951),
      inverseOnSurface: Color(4278190080),
      inversePrimary: Color(4278201667),
      primaryFixed: Color(4291881727),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4288140026),
      onPrimaryFixedVariant: Color(4278196262),
      secondaryFixed: Color(4294959322),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4294949549),
      onSecondaryFixedVariant: Color(4281533698),
      tertiaryFixed: Color(4289198045),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4287355585),
      onTertiaryFixedVariant: Color(4278197012),
      surfaceDim: Color(4279243799),
      surfaceBright: Color(4281678397),
      surfaceContainerLowest: Color(4278849298),
      surfaceContainerLow: Color(4279770144),
      surfaceContainer: Color(4280033316),
      surfaceContainerHigh: Color(4280691246),
      surfaceContainerHighest: Color(4281414969),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme().toColorScheme());
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

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary, 
    required this.surfaceTint, 
    required this.onPrimary, 
    required this.primaryContainer, 
    required this.onPrimaryContainer, 
    required this.secondary, 
    required this.onSecondary, 
    required this.secondaryContainer, 
    required this.onSecondaryContainer, 
    required this.tertiary, 
    required this.onTertiary, 
    required this.tertiaryContainer, 
    required this.onTertiaryContainer, 
    required this.error, 
    required this.onError, 
    required this.errorContainer, 
    required this.onErrorContainer, 
    required this.background, 
    required this.onBackground, 
    required this.surface, 
    required this.onSurface, 
    required this.surfaceVariant, 
    required this.onSurfaceVariant, 
    required this.outline, 
    required this.outlineVariant, 
    required this.shadow, 
    required this.scrim, 
    required this.inverseSurface, 
    required this.inverseOnSurface, 
    required this.inversePrimary, 
    required this.primaryFixed, 
    required this.onPrimaryFixed, 
    required this.primaryFixedDim, 
    required this.onPrimaryFixedVariant, 
    required this.secondaryFixed, 
    required this.onSecondaryFixed, 
    required this.secondaryFixedDim, 
    required this.onSecondaryFixedVariant, 
    required this.tertiaryFixed, 
    required this.onTertiaryFixed, 
    required this.tertiaryFixedDim, 
    required this.onTertiaryFixedVariant, 
    required this.surfaceDim, 
    required this.surfaceBright, 
    required this.surfaceContainerLowest, 
    required this.surfaceContainerLow, 
    required this.surfaceContainer, 
    required this.surfaceContainerHigh, 
    required this.surfaceContainerHighest, 
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface,
      surfaceVariant: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
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
