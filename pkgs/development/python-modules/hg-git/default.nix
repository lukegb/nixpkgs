{ stdenv
, buildPythonPackage
, fetchPypi
, dulwich
, fetchpatch
}:

buildPythonPackage rec {
  pname = "hg-git";
  version = "0.9.0a1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1lhb813zljki3q10bx3n9d7c075s6ahhak5d3a1m6gaxmy6gzj5y";
  };

  doCheck = false;

  propagatedBuildInputs = [ dulwich ];

  meta = with stdenv.lib; {
    description = "Push and pull from a Git server using Mercurial";
    homepage = "http://hg-git.github.com/";
    maintainers = with maintainers; [ koral ];
    license = stdenv.lib.licenses.gpl2;
  };

}
