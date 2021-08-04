///Contains the build info for the app
class BuildInfo {
  ///Takes [appName] [version] [buildNumber]
  const BuildInfo(
      {required this.appName,
      required this.version,
      required this.buildNumber});

  ///[appName] name of the app
  ///[version] current version of the app
  ///[buildNumber] current build number for the app
  final String appName, version, buildNumber;
}
