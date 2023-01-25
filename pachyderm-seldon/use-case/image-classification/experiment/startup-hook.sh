export HTTP_PROXY=http://proxy.houston.hpecorp.net:8080/
export HTTPS_PROXY=http://proxy.houston.hpecorp.net:8080/
export NO_PROXY="localhost,127.0.0.1,.us.cray.com,.americas.cray.com,.dev.cray.com,.eag.rdlabs.hpecorp.net,.hpecorp.net,casablanca-login"
echo >&2 "Installing scikit-image"
pip install scikit-image==0.19.2 python_pachyderm==7.3.0
