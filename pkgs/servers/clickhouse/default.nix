{ stdenv, fetchFromGitHub, cmake, libtool, lldClang, ninja
, boost, brotli, capnproto, cctz, clang-unwrapped, double-conversion
, icu, jemalloc, libcpuid, libxml2, lld, llvm, lz4, libmysqlclient, openssl, perl
, poco, protobuf, python3, rapidjson, re2, rdkafka, readline, sparsehash, unixODBC
, xxHash, zstd
}:

stdenv.mkDerivation rec {
  pname = "clickhouse";
  version = "20.11.4.13";

  src = fetchFromGitHub {
    owner  = "ClickHouse";
    repo   = "ClickHouse";
    rev    = "v${version}-stable";
    fetchSubmodules = true;
    sha256 = "0c87k0xqwj9sc3xy2f3ngfszgjiz4rzd787bdg6fxp94w1adjhny";
  };

  nativeBuildInputs = [ cmake libtool lldClang.bintools ninja ];
  buildInputs = [
    boost brotli capnproto cctz clang-unwrapped double-conversion
    icu jemalloc libcpuid libxml2 lld llvm lz4 libmysqlclient openssl perl
    poco protobuf python3 rapidjson re2 rdkafka readline sparsehash unixODBC
    xxHash zstd
  ];

  postPatch = ''
    patchShebangs src/

    substituteInPlace contrib/openssl-cmake/CMakeLists.txt \
      --replace '/usr/bin/env perl' perl
    substituteInPlace src/Storages/System/StorageSystemLicenses.sh \
      --replace 'git rev-parse --show-toplevel' '$src'
    substituteInPlace utils/check-style/check-duplicate-includes.sh \
      --replace 'git rev-parse --show-toplevel' '$src'
    substituteInPlace utils/check-style/check-ungrouped-includes.sh \
      --replace 'git rev-parse --show-toplevel' '$src'
    substituteInPlace utils/generate-ya-make/generate-ya-make.sh \
      --replace 'git rev-parse --show-toplevel' '$src'
    substituteInPlace utils/list-licenses/list-licenses.sh \
      --replace 'git rev-parse --show-toplevel' '$src'
    substituteInPlace utils/check-style/check-style \
      --replace 'git rev-parse --show-toplevel' '$src'
  '';

  cmakeFlags = [
    "-DENABLE_TESTS=OFF"
  ];

  postInstall = ''
    rm -rf $out/share/clickhouse-test

    sed -i -e '\!<log>/var/log/clickhouse-server/clickhouse-server\.log</log>!d' \
      $out/etc/clickhouse-server/config.xml
    substituteInPlace $out/etc/clickhouse-server/config.xml \
      --replace "<errorlog>/var/log/clickhouse-server/clickhouse-server.err.log</errorlog>" "<console>1</console>"
  '';

  hardeningDisable = [ "format" ];

  meta = with stdenv.lib; {
    homepage = "https://clickhouse.tech/";
    description = "Column-oriented database management system";
    license = licenses.asl20;
    maintainers = with maintainers; [ orivej ];
    platforms = platforms.linux;
  };
}
