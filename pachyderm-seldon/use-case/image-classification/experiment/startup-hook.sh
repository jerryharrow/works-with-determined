echo >&2 "Installing scikit-image"
pip install scikit-image==0.19.2 python_pachyderm==7.3.0

# Unset proxies so we can use pachyderm API 
unset http_proxy https_proxy HTTP_PROXY HTTPS_PROXY
