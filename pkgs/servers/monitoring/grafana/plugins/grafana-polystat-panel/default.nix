{ grafanaPlugin, lib }:

grafanaPlugin rec {
  pname = "grafana-polystat-panel";
  version = "2.1.2";
  zipHash = "sha256-YCtv232IQM4FVEzwiu5YpRBc+cj9GfNr3TiWSpa4fhc=";
  meta = with lib; {
    description = "Hexagonal multi-stat panel for Grafana";
    license = licenses.asl20;
    maintainers = with maintainers; [ lukegb ];
    platforms = platforms.unix;
  };
}
