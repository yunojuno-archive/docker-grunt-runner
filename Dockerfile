# ================================================
# Dockerfile for yunojuno/grunt-runner
# ================================================
#
# This image builds on the basic Node+npm image to add
# in Bower and Grunt globally so they are available as
# commands.
# ================================================
FROM yunojuno/node
MAINTAINER Hugo Rodger-Brown <hugo@yunojuno.com>

# We want to use bower and grunt from the command line,
# so need to install globally and not via package.json
RUN npm install --global grunt-cli bower
