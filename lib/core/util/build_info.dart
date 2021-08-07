///Contains the build info for the app
class BuildInfo {
  ///Takes [appName] [version] [buildNumber]
  const BuildInfo(
      {String? appName, String? version, String? buildNumber, bool? isAndroid})
      : appName = appName ?? 'GROW',
        buildNumber = buildNumber ?? '0',
        version = version ?? 'err',
        isAndroid = isAndroid ?? true;

  ///[appName] name of the app
  ///[version] current version of the app
  ///[buildNumber] current build number for the app
  final String appName, version, buildNumber;

  ///Whether or not the os is android or iOS
  final bool isAndroid;
}
