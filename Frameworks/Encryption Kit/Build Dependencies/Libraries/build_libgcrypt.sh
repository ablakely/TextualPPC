#!/bin/bash

set -e

pushd "${LIBRARY_WORKING_DIRECTORY_LOCATION}"

#curl -k -LO "ftp://ftp.gnupg.org/gcrypt/libgcrypt/libgcrypt-${LIBRARY_GCRYPT_VERSION}.tar.bz2"  --retry 5
curl -k "ftp://ftp.gnupg.org/gcrypt/libgcrypt/libgcrypt-${LIBRARY_GCRYPT_VERSION}.tar.gz" > libgcrypt.tar.gz

tar -xvf "./libgcrypt.tar.gz"

mv "./libgcrypt-${LIBRARY_GCRYPT_VERSION}" "./libgcrypt-source"

cd "./libgcrypt-source"

./configure --disable-shared --enable-static \
--prefix="${SHARED_RESULT_ROOT_LOCATION}" \
--with-sysroot="${PLATFORM_BUILD_SDK_ROOT_LOCATION}" \
--with-libgpg-error-prefix="${SHARED_RESULT_ROOT_LOCATION}" \
LDFLAGS="${LDFLAGS}" \
CFLAGS="${CFLAGS}" \
CPPLAGS="${CPPFLAGS}"

make
make install

popd
