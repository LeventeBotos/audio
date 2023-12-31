mkdir audio
cd audio
sudo apt-get update
sudo apt-get upgrade

sudo apt install --no-install-recommends build-essential git autoconf automake libtool libpopt-dev libconfig-dev libasound2-dev avahi-daemon libavahi-client-dev libssl-dev libsoxr-dev libplist-dev libsodium-dev libavutil-dev libavcodec-dev libavformat-dev uuid-dev libgcrypt-dev xxd

git clone https://github.com/mikebrady/nqptp.git
cd nqptp
autoreconf -fi
./configure --with-systemd-startup
sudo make 
sudo make install

systemctl enable nqptp
systemctl start nqptp
cd ../

git clone https://github.com/mikebrady/shairport-sync.git
cd shairport-sync
autoreconf -fi
./configure --sysconfdir=/etc --with-alsa --with-soxr --with-avahi --with-ssl=openssl --with-systemd --with-airplay-2
make
make install

cd ../

systemctl enable shairport-sync
systemctl start shairport-sync

sudo add-apt-repository ppa:spocon/spocon
sudo apt-get -y update
sudo apt-get install spocon 
