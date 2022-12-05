{ grafanaPlugin, lib }:

grafanaPlugin rec {
  pname = "grafadruid-druid-datasource";
  version = "1.4.0";
  zipHash = "sha256-+49otAAFSoCFvEKtmRCQu52durfNqMZipV3znLKR2R4=";
  meta = with lib; {
    description = "Connects Grafana to Druid";
    license = licenses.asl20;
    maintainers = with maintainers; [ nukaduka ];
    platforms = platforms.unix;
  };
}
