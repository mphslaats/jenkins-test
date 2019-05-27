FROM payara/server-full:latest

LABEL maintainer="mphslaats.com"

RUN ${PAYARA_DIR}/bin/asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} start-domain ${DOMAIN_NAME} \
    # Prevent known bug: https://github.com/payara/Payara/issues/3495
    && ${PAYARA_DIR}/bin/asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} set-payara-executor-service-configuration --threadpoolexecutorqueuesize 1000 \
    && ${PAYARA_DIR}/bin/asadmin --user=${ADMIN_USER} --passwordfile=${PASSWORD_FILE} stop-domain ${DOMAIN_NAME}

COPY target/*.war ${DEPLOY_DIR}
