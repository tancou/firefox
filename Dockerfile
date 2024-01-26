FROM jlesage/firefox:v24.01.1

RUN num=$(grep -n -m 1 "# Window size." /etc/services.d/xvnc/params | cut -d: -f1) && \
    sed -i "${num}i\echo '-AcceptCutText=0'\necho '-SendCutText=0'\necho '-noclipboard'\n" /etc/services.d/xvnc/params

COPY no_direct_ip-0.3.0.xpi /usr/lib/firefox/distribution/extensions/{d43fcf27-0a5c-4c1e-9847-f22d0bb0b4d4}.xpi
COPY max_tabs_web_ext-0.1.0.xpi /usr/lib/firefox/distribution/extensions/max-tabs@kanru.xpi

COPY mozilla.cfg /usr/lib/firefox/
COPY local-settings.js /usr/lib/firefox/defaults/pref/
COPY policies.json /usr/lib/firefox/distribution/