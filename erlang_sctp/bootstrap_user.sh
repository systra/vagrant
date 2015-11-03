curl -O https://raw.githubusercontent.com/yrashk/kerl/master/kerl
chmod u+x kerl

cat << EOF > .kerlrc
KERL_CONFIGURE_OPTIONS="--enable-sctp --disable-hipe -disable-debug --without-javac --enable-shared-zlib --enable-smp-support --enable-threads --enable-kernel-poll --enable-dynamic-ssl-libs --with-wx"
CFLAGS="-DOPENSSL_NO_EC=1"
KERL_INSTALL_HTMLDOCS=no
KERL_INSTALL_MANPAGES=yes
EOF

./kerl update releases
./kerl build git https://github.com/erlang/otp.git OTP-17.5.6.3 17.5.6.3 && \
./kerl install 17.5.6.3 /opt/erlang/17.5.6.3 && \
echo ". /opt/erlang/17.5.6.3/activate" >> .bashrc

. /opt/erlang/17.5.6.3/activate

mkdir libs
cd libs
git clone https://github.com/ferd/erlang-history.git
cd erlang-history
make
make install
cd ..
rm -rf erlang-history
git clone https://github.com/systra/erlang_user_utils.git
cd erlang_user_utils
make
echo "code:load_abs(\"/home/vagrant/libs/erlang_user_utils/user_default\")." >> /home/vagrant/.erlang

