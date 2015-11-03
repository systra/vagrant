apt-get update
apt-get -y install build-essential freeglut3-dev libncurses5-dev autoconf git libwxgtk2.8-dev autoconf libssl-dev
apt-get -y install vim curl git silversearcher-ag tree
apt-get -y install libsctp-dev lksctp-tools

mkdir -p /opt/erlang
chown vagrant:vagrant /opt/erlang
