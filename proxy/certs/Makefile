all: prepare out/localhost.crt out/localhost.decrypted.key

prepare: clean
	mkdir -p build
	mkdir -p out

out/localhost.crt: out/CA.pem build/localhost.csr
	openssl x509 -req -in build/localhost.csr -CA out/CA.pem -CAkey build/CA.key -CAcreateserial -days 3650 -sha256 -extfile localhost.ext -out out/localhost.crt

build/CA.key:
	openssl genrsa -out build/CA.key -des3 2048

out/CA.pem: build/CA.key
	openssl req -x509 -sha256 -new -nodes -days 3650 -key build/CA.key -out out/CA.pem

build/localhost.key:
	openssl genrsa -out build/localhost.key -des3 2048

build/localhost.csr: build/localhost.key
	openssl req -new -key build/localhost.key -out build/localhost.csr

out/localhost.decrypted.key: build/localhost.key
	openssl rsa -in build/localhost.key -out out/localhost.decrypted.key

clean:
	rm -rf build
	rm -rf out
