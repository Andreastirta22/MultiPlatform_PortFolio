import 'package:portfolio/features/eng_capabilities/model/engineering_platform.dart';

extension EngineeringPlatformExtension on EngineeringPlatform {
  bool get isMobile => switch (this) {
    EngineeringPlatform.android || EngineeringPlatform.ios => true,
    _ => false,
  };

  bool get isDesktop => switch (this) {
    EngineeringPlatform.windows ||
    EngineeringPlatform.macos ||
    EngineeringPlatform.linux => true,
    _ => false,
  };

  bool get isWeb => this == EngineeringPlatform.web;

  bool get isCloud => this == EngineeringPlatform.cloud;

  bool get isBackend => this == EngineeringPlatform.backend;
}
