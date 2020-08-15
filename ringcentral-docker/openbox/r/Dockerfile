FROM frankieliu/chrome-vnc-openbox:latest
ENV DISPLAY :99

# install R
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
RUN add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran40/'

# R studio won't work without libxkbcommon-x11-dev
#
# https://community.rstudio.com/t/problem-at-running-rstudio-on-debian10-qt-qpa-plugin-could-not-load-the-qt-platform-plugin-xcb/38519
# 
# Rather than to add to the bloat of the docker image
# one can download the .tar.gz for R-studio and run
# R-studio from a local directory

#install node
RUN apt-get update -yq \
    && apt-get install r-base -yq \
    && apt-get install libxkbcommon-x11-dev -yq
#    && apt-get install openbox -yq \ 
#    && apt-get install tint2 -yq \
#    && apt-get install python -yq \
#    && apt-get install gdebi-core -yq \
#    && apt-get install tmux -yq \
#    && apt-get install unzip -yq 


# It's a good idea to use dumb-init to help prevent zombie chrome processes.
# ADD https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64 /usr/local/bin/dumb-init
# RUN chmod +x /usr/local/bin/dumb-init

# Install tools
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

ENTRYPOINT ["dumb-init", "--"]
