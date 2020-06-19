pushd pdns-recursor
    docker build -t krypticlabs/pdns-recursor .
popd

pushd pdns-mysql
    docker build -t krypticlabs/pdns-mysql .
popd

pushd pdns-server
    docker build -t krypticlabs/pdns-server .
popd
