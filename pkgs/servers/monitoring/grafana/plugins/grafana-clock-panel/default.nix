{ grafanaPlugin, lib }:

grafanaPlugin rec {
  pname = "grafana-clock-panel";
  version = "2.1.7";
  zipHash = "sha256-dZ0jZrMCoZdDnjPCVmtgCchUbniS0/EbOMsKh0BGpyM=";
  meta = with lib; {
    description = "Clock panel for Grafana";
    license = licenses.mit;
    maintainers = with maintainers; [ lukegb ];
    platforms = platforms.unix;
  };
}
