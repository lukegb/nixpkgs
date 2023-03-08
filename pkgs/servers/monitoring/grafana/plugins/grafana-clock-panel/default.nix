{ grafanaPlugin, lib }:

grafanaPlugin rec {
  pname = "grafana-clock-panel";
  version = "2.1.3";
  zipHash = "sha256-A+oDei4LneyBgGPeOQLHgR67vs9u2pUE3vwBYgIeiTM=";
  meta = with lib; {
    description = "Clock panel for Grafana";
    license = licenses.mit;
    maintainers = with maintainers; [ lukegb ];
    platforms = platforms.unix;
  };
}
