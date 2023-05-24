{ grafanaPlugin, lib }:

grafanaPlugin rec {
  pname = "grafana-polystat-panel";
  version = "2.0.8";
  zipHash = "sha256-w5sPED1qrVRJvuP2hbhoXzqJ4l42iGIlgSMNEsWaZkE=";
  meta = with lib; {
    description = "Hexagonal multi-stat panel for Grafana";
    license = licenses.asl20;
    maintainers = with maintainers; [ lukegb ];
    platforms = platforms.unix;
  };
}
