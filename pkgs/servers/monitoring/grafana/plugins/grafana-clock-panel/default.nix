{ grafanaPlugin, lib }:

grafanaPlugin rec {
  pname = "grafana-clock-panel";
  version = "2.1.5";
  zipHash = "sha256-yk50ipF8HVzJ3a1xZcc4tY2IIRO+J+cfgfSYLaQJbj8=";
  meta = with lib; {
    description = "Clock panel for Grafana";
    license = licenses.mit;
    maintainers = with maintainers; [ lukegb ];
    platforms = platforms.unix;
  };
}
