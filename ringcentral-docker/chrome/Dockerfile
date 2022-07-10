FROM ubuntu

# from hub.docker.com set up locale
RUN apt-get update && apt-get install -y locales apt-utils && rm -rf /var/lib/apt/lists/* \
 && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

ENV LANG en_US.utf8

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# And afterwards whatever you like, for example:
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get -y \
 --no-install-recommends install tzdata

RUN apt-get update -y && apt-get install -y --no-install-recommends \
 htop less \ 
 rsync tar xzip 7zip gzip bzip2 zip unzip \
 wget curl \
 xterm xfce4-terminal lxterminal \
 x11vnc xvfb xdg-utils \
 xfce4 xfce4-panel tint2 \
 wmctrl \
 wget \
 tigervnc-standalone-server tigervnc-xorg-extension tigervnc-common tigervnc-tools \
 nano vim \
 jq \
 geeqie \
 imagemagick

# Set the Chrome repo.
# RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
#    && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list

# Install Chrome.
RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates
RUN curl -sL "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb" > /tmp/chrome.deb 
RUN apt install --no-install-recommends --no-install-suggests -y \
 /tmp/chrome.deb 

COPY install_chrome_driver.sh /
RUN chmod +x /install_chrome_driver.sh && /install_chrome_driver.sh



# Add the bootstrap script
# COPY bootstrap.sh /
# RUN chmod +x /bootstrap.sh
# CMD '/bootstrap.sh'

# ENTRYPOINT ["/usr/bin/dumb-init", "--"]
# CMD ["/usr/bin/bash"]

RUN apt-get update -y

# RUN rm /var/lib/apps/lists/lock

RUN apt-get -y --no-install-recommends install \
  fluxbox twm openbox \
  git \
  software-properties-common \
  sudo \
  iputils-ping \
  xauth \
  x11-utils \
  x11-xserver-utils \
  fonts-dejavu libxml2-dev \
  binutils binfmt-support python3-setuptools \
  gdebi-core \
  tmux \
  menu menu-l10n \
  gimp inkscape snapd \
  xfonts-100dpi xfonts-scalable

# Add a user for running applications.
RUN useradd -s /bin/bash -m apps
RUN echo >> /etc/sudoers 
RUN echo "apps ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

WORKDIR /home/apps
RUN mkdir /home/apps/.vnc
COPY xstartup /home/apps/.vnc

RUN mkdir /home/apps/bin
COPY start_tiger_vnc.sh /home/apps/bin

COPY Xresources /home/apps
COPY my_chrome.sh /home/apps

RUN chown -v -R apps:apps /home/apps
USER apps
