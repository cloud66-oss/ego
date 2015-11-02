FROM rails:onbuild

# This prevents us from get errors during apt-get installs as it notifies the
# environment that it is a non-interactive one.
ENV DEBIAN_FRONTEND noninteractive

RUN apt-add-repository ppa:anton+/photo-video-apps 
RUN apt-get update -y 
RUN apt-get install -y imagemagick libmagickwand-dev 
RUN apt-get install --reinstall ghostscript

