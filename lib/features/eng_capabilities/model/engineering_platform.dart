enum EngineeringPlatform {
  android(label: "Android", iconAsset: "assets/icons/platform/android.png"),

  ios(label: "iOS", iconAsset: "assets/icons/platform/ios.png"),

  web(label: "Web", iconAsset: "assets/icons/platform/web.png"),

  windows(label: "Windows", iconAsset: "assets/icons/platform/windows.png"),

  macos(label: "macOS", iconAsset: "assets/icons/platform/macos.png"),

  linux(label: "Linux", iconAsset: "assets/icons/platform/linux.png"),

  backend(label: "Backend", iconAsset: "assets/icons/platform/backend.png"),

  cloud(label: "Cloud", iconAsset: "assets/icons/platform/cloud.png");

  const EngineeringPlatform({required this.label, required this.iconAsset});

  final String label;
  final String iconAsset;
}
