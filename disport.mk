disport_cirrus_upload : disport
	tar -czf _disport.txz _disport
	curl -s -X POST --data-binary @_disport.txz http://${CIRRUS_HTTP_CACHE_HOST}/_disport-${CIRRUS_BUILD_ID}.txz

disport_poudriere:
	pkg upgrade -y
	pkg install -y tailscale curl
	service tailscaled enable
	service tailscaled start
	tailscale up --authkey ${TS_KEY} --hostname cirrus-${CIRRUS_REPO_NAME}-${CIRRUS_BRANCH}-${CIRRUS_BUILD_ID}
	mkdir -m 700 /.cirrus_ssh
	echo "${PKG_HOST}" > /.cirrus_ssh/known_hosts
	echo "${SSH_KEY}" > /.cirrus_ssh/key
	chmod 600 /.cirrus_ssh/*
	curl -o disport.txz http://${CIRRUS_HTTP_CACHE_HOST}/_disport-${CIRRUS_BUILD_ID}.txz
	tar -xzf _disport.txz
	ssh -i /.cirrus_ssh/key -o UserKnownHostsFile=/.cirrus_ssh/known_hosts cirrus@pkg "mkdir -p ports/devel/hello_pkg"
	scp -i /.cirrus_ssh/key -o UserKnownHostsFile=/.cirrus_ssh/known_hosts _disport/* cirrus@pkg:ports/devel/hello_pkg/
	ssh -i /.cirrus_ssh/key -o UserKnownHostsFile=/.cirrus_ssh/known_hosts cirrus@pkg "sudo poudriere bulk -j 131RC6 -p default -O cirrus devel/hello_pkg"
