{ lib
, buildPythonPackage
, fetchurl
, pythonOlder
, pytestCheckHook
}:

buildPythonPackage rec {
  pname = "buildcatrust";
  version = "0.1.3";

  src = fetchurl {
    url = "mirror://testpypi/b/${pname}/${pname}-${version}.tar.gz";
    sha256 = "sha256:0s0m0fy943dakw9cbd40h46qmrhhgrcp292kppyb34m6y27sbagy";
  };

  checkInputs = [
    pytestCheckHook
  ];
  disabledTestPaths = [
    "buildcatrust/tests/test_nonhermetic.py"
  ];

  pythonImportsCheck = [ "buildcatrust" "buildcatrust.cli" ];

  meta = with lib; {
    description = "Build SSL/TLS trust stores";
    homepage = "https://github.com/lukegb/buildcatrust";
    license = licenses.mit;
    maintainers = with maintainers; [ lukegb ];
  };
}
