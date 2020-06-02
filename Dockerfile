FROM node:lts as build

ARG DEPLOY_DIR=/deploy
ARG PACKAGE_NAME
ARG SCENARIO_NAME

ENV REPOSITORY_ROOT=/earnin-script
ENV IRR="node ${REPOSITORY_ROOT}/common/scripts/install-run-rush.js"

RUN mkdir ${DEPLOY_DIR} \
  && chown node:node ${DEPLOY_DIR}

COPY --chown=node:node . ${REPOSITORY_ROOT}
WORKDIR ${REPOSITORY_ROOT}

RUN $IRR install
RUN $IRR build -t ${PACKAGE_NAME}
RUN $IRR deploy -s ${SCENARIO_NAME} -t ${DEPLOY_DIR}

RUN echo "#!/bin/sh" > /entrypoint.sh
RUN echo npm run --prefix ${DEPLOY_DIR}/$($IRR list -p | grep ${PACKAGE_NAME} | awk '{ print $4 }')  start >> /entrypoint.sh
RUN chmod 755 /entrypoint.sh

####

FROM node:lts as final

ARG DEPLOY_DIR=/deploy
COPY --chown=node:node --from=build ${DEPLOY_DIR} ${DEPLOY_DIR}
COPY --chown=node:node --from=build /entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
