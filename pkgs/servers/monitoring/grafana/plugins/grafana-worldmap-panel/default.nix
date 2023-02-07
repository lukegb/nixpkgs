{ grafanaPlugin, lib }:

grafanaPlugin rec {
  pname = "grafana-worldmap-panel";
  version = "1.0.2";
  zipHash = "sha256-STD09fKGH4ObLPsfGmC6eZIISEKzMaLfNjRLEBKBqhY=";
  meta = with lib; {
    description = "World Map panel for Grafana";
    license = licenses.mit;
    maintainers = with maintainers; [ lukegb ];
    platforms = platforms.unix;
  };
}
