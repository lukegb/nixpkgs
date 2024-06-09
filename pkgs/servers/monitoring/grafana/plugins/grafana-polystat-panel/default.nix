{ grafanaPlugin, lib }:

grafanaPlugin rec {
  pname = "grafana-polystat-panel";
  version = "2.1.11";
  zipHash = "sha256-Go2ew7BP/19UjaPaxn0ya6Rgf+ZAbFSV/lrgYuGjtIs=";
  meta = with lib; {
    description = "Hexagonal multi-stat panel for Grafana";
    license = licenses.asl20;
    maintainers = with maintainers; [ lukegb ];
    platforms = platforms.unix;
  };
}
