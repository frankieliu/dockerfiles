FROM ringcentral/chrome-vnc:chrome75

RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add -

RUN apt-get update -yq \
    && apt autoremove -yq

# ENV DEBIAN_FRONTEND noninteractive
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

RUN apt-get install tigervnc-xorg-extension -yq
# apt-get install keyboard-configuration

RUN apt-get install curl gnupg -yq \
    && apt-get install openbox tint2 fonts-dejavu libxml2-dev -yq \ 
    && apt-get install python python-doc binutils binfmt-support python3-setuptools -yq \
    && apt-get install gdebi-core -yq \
    && apt-get install tmux -yq \
    && apt-get install zip unzip -yq \
    && apt-get install menu menu-l10n -yq

RUN apt-get install imagemagick geeqie gimp inkscape snapd -yq

RUN apt-get install tigervnc-standalone-server xfonts-100dpi xfonts-scalable -yq \
    && apt-get install tigervnc-xorg-extension -yq \
    && apt-get install tigervnc-viewer -yq

RUN bash -c "echo -e '123456\n123456\nn' | vncpasswd"

COPY Xresources /root
COPY tiger.sh /root
RUN chmod +x /root/tiger.sh
COPY Xvnc-session /root/.vnc
COPY readme.md /root

ENV DISPLAY :1
EXPOSE 5901

#It's a good idea to use dumb-init to help prevent zombie chrome processes.
ADD https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64 /usr/local/bin/dumb-init
RUN chmod +x /usr/local/bin/dumb-init

#Install tools
# RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
# RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
# RUN apt-get update && apt-get install yarn
# RUN npm init -y
# RUN yarn add puppeteer
# RUN yarn global add lerna

# Set Timezone
# RUN echo "Asia/Shanghai" > /etc/timezone
# RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
# RUN dpkg-reconfigure -f noninteractive tzdata
 
# https://stackoverflow.com/questions/28405902/how-to-set-the-locale-inside-a-debian-ubuntu-docker-container
RUN export DEBIAN_FRONTEND=noninteractive
RUN apt-get install --yes locales
RUN locale-gen --no-purge en_US.UTF-8
RUN update-locale LANG=en_US.UTF-8
RUN echo locales locales/locales_to_be_generated multiselect en_US.UTF-8 UTF-8 | debconf-set-selections
RUN echo locales locales/default_environment_locale select en_US.UTF-8 | debconf-set-selections
RUN echo 158 | dpkg-reconfigure locales

ENTRYPOINT ["dumb-init", "--"]
