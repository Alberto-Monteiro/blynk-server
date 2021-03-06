#!/bin/sh

set -e

echo "server.properties=${SERVER_PROPERTIES}
mail.properties=${MAIL_PROPERTIES}
web.request.max.size=${WEB_REQUEST_MAX_SIZE}
user.tags.limit=${USER_TAGS_LIMIT}
net.interface=${NET_INTERFACE}
force.port.80.for.redirect=${FORCE_PORT_80_FOR_REDIRECT}
user.devices.limit=${USER_DEVICES_LIMIT}
notifications.frequency.user.quota.limit=${NOTIFICATIONS_FREQUENCY_USER_QUOTA_LIMIT}
user.profile.max.size=${USER_PROFILE_MAX_SIZE}
profile.save.worker.period=${PROFILE_SAVE_WORKER_PERIOD}
data.folder=${DATA_FOLDER}
server.ssl.cert=${SERVER_SSL_CER}
user.message.quota.limit=${USER_MESSAGE_QUOTA_LIMIT}
enable.raw.db.data.store=${ENABLE_RAW_DB_DATA_STORE}
enable.db=${ENABLE_DB}
user.widget.max.size.limit=${USER_WIDGET_MAX_SIZE_LIMIT}
allow.reading.widget.without.active.app=${ALLOW_READING_WIDGET_WITHOUT_ACTIVE_APP}
stats.print.worker.period=${STATS_PRINT_WORKER_PERIOD}
log.level=${LOG_LEVEL}
restore.host=${RESTORE_HOST}
lcd.strings.pool.size=${LCD_STRINGS_POOL_SIZE}
hardware.mqtt.port=${HARDWARE_MQTT_PORT}
admin.pass=${ADMIN_PAS}
allowed.administrator.ips=${ALLOWED_ADMINISTRATOR_IPS}
listen.address=${LISTEN_ADDRES}
http.port=${HTTP_PORT}
restore=${RESTORE}
server.ssl.key=${SERVER_SSL_KE}
admin.rootPath=${ADMIN_ROOTPATH}
product.name=${PRODUCT_NAME}
csv.export.data.points.max=${CSV_EXPORT_DATA_POINTS_MAX}
allow.store.ip=${ALLOW_STORE_IP}
force.port.80.for.csv=${FORCE_PORT_80_FOR_CSV}
hard.socket.idle.timeout=${HARD_SOCKET_IDLE_TIMEOUT}
async.logger.ring.buffer.size=${ASYNC_LOGGER_RING_BUFFER_SIZE}
https.port=${HTTPS_PORT}
logs.folder=${LOGS_FOLDER}
webhooks.frequency.user.quota.limit=${WEBHOOKS_FREQUENCY_USER_QUOTA_LIMIT}
initial.energy=${INITIAL_ENERGY}
blocking.processor.thread.pool.limit=${BLOCKING_PROCESSOR_THREAD_POOL_LIMIT}
table.rows.pool.size=${TABLE_ROWS_POOL_SIZE}
admin.email=${ADMIN_EMAIL}
map.strings.pool.size=${MAP_STRINGS_POOL_SIZE}
server.ssl.key.pass=${SERVER_SSL_KEY_PAS}
user.dashboard.max.limit=${USER_DASHBOARD_MAX_LIMIT}
webhooks.response.size.limit=${WEBHOOKS_RESPONSE_SIZE_LIMIT}
terminal.strings.pool.size=${TERMINAL_STRINGS_POOL_SIZE}
notifications.queue.limit=${NOTIFICATIONS_QUEUE_LIMIT}
" >/config/server.properties

echo "mail.smtp.username=${MAIL_SMTP_USERNAME}
mail.smtp.port=${MAIL_SMTP_PORT}
mail.smtp.password=${MAIL_SMTP_PASSWORD}
mail.smtp.auth=${MAIL_SMTP_AUTH}
mail.smtp.starttls.enable=${MAIL_SMTP_STARTTLS_ENABLE}
mail.smtp.timeout=${MAIL_SMTP_TIMEOUT}
mail.smtp.host=${MAIL_SMTP_HOST}
mail.smtp.connectiontimeout=${MAIL_SMTP_CONNECTIONTIMEOUT}
" >/config/mail.properties

echo "jdbc.url=${JDBC_URL}
user=${USER}
password=${PASSWORD}
connection.timeout.millis=${CONNECTION_TIMEOUT_MILLIS}
clean.reporting=${CLEAN_REPORTING}
reporting.jdbc.url=${REPORTING_JDBC_URL}
reporting.user=${REPORTING_USER}
reporting.password=${REPORTING_PASSWORD}
reporting.connection.timeout.millis=${REPORTING_CONNECTION_TIMEOUT_MILLIS}
" >/config/db.properties

FILE=/blynk/server-${BLYNK_SERVER_VERSION}.jar

if [ ! -f "$FILE" ]; then
  curl -L https://github.com/blynkkk/blynk-server/releases/download/v"${BLYNK_SERVER_VERSION}"/server-"${BLYNK_SERVER_VERSION}".jar >"$FILE"
fi

java -jar "$FILE" -dataFolder /data -serverConfig /config/server.properties -mailConfig /config/mail.properties
