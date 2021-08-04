FROM storjlabs/storagenode as addon
FROM qmcgaw/gluetun
COPY --from=addon /app/ /app/
COPY --from=addon /entrypoint /app/entrypoint
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
WORKDIR /app
ENTRYPOINT ["/entrypoint.sh"]