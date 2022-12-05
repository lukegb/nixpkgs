{ grafanaPlugin, lib }:

grafanaPlugin rec {
  pname = "grafana-clock-panel";
  version = "2.1.1";
  zipHash = "sha256-cDwKObAxtyY8Ng6UQcYMfHk8vh3XvoJv5ojc2BEhxdQ=";
  meta = with lib; {
    description = "Clock panel for Grafana";
    license = licenses.mit;
    maintainers = with maintainers; [ lukegb ];
    platforms = platforms.unix;
  };
}
