#!/usr/bin/bash
# CHROME_VERSION=”google-chrome-stable”
# CHROME_MAJOR_VERSION=$(google-chrome -version | sed -E "s/.* ([0–9]+)(\.[0–9]+){3}.*/\1/")
# CHROME_DRIVER_VERSION=$(wget --no-verbose -O - "https://chromedriver.storage.googleapis.com/LATEST_RELEASE_${CHROME_MAJOR_VERSION}")

BASE_URL=https://chromedriver.storage.googleapis.com
VERSION=$(curl -sL "$BASE_URL/LATEST_RELEASE")
echo $VERSION >> driverInfo.txt 
echo Using chromedriver version: $VERSION
curl -sL "$BASE_URL/$VERSION/chromedriver_linux64.zip" -o /tmp/chromedriver_linux64.zip
unzip /tmp/chromedriver_linux64.zip -d /tmp
chmod 755 /tmp/chromedriver
mv /tmp/chromedriver /usr/local/bin/
rm -rf /tmp/*
