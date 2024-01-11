FROM jlesage/firefox-esr:v23.12.1

RUN num=$(grep -n -m 1 "# Window size." /etc/services.d/xvnc/params | cut -d: -f1) && \
    sed -i "${num}i\echo '-AcceptCutText=0'\necho '-SendCutText=0'\necho '-noclipboard'\n" /etc/services.d/xvnc/params