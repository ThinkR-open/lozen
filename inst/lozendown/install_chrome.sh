echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list
apt-get install -y gpgv dirmngr \
&& wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
  echo "Comenzando actualizacion"
apt-get update
echo "Finalizando actualizacion"
apt-get -y install libxpm4 libxrender1 libgtk2.0-0 libnss3 libgconf-2-4
apt-get -y install xvfb gtk2-engines-pixbuf
apt-get -y install xfonts-cyrillic xfonts-100dpi xfonts-75dpi xfonts-base xfonts-scalable
apt-get -y install google-chrome-stable

R -e "remotes::install_cran('pagedown')"
R -e "remotes::install_cran('webshot')"
