#!/usr/bin/env bash

CA_NAME=derico-ca
DOMAIN_NAME=haikuter.com # Use your own domain name

######################
# Become a Certificate Authority
######################

# Generate private key
openssl genrsa -des3 -out $CA_NAME.key 2048
# Generate root certificate
openssl req -x509 -new -nodes -key $CA_NAME.key -sha256 -days 825 -out $CA_NAME.pem

######################
# Create CA-signed certs
######################

# Generate a private key
openssl genrsa -out $DOMAIN_NAME.key 2048
# Create a certificate-signing request
openssl req -new -key $DOMAIN_NAME.key -out $DOMAIN_NAME.csr
# Create a config file for the extensions
>$DOMAIN_NAME.ext cat <<-EOF
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
subjectAltName = @alt_names
[alt_names]
DNS.1 = $DOMAIN_NAME # Be sure to include the domain name here because Common Name is not so commonly honoured by itself
DNS.2 = staging.$DOMAIN_NAME # Optionally, add additional domains (I've added a subdomain for the staging server)
#IP.1 = 127.0.0.1 # Optionally, add an IP address (if the connection which you have planned requires it)
EOF
# Create the signed certificate
openssl x509 -req -in $DOMAIN_NAME.csr -CA $CA_NAME.pem -CAkey $CA_NAME.key -CAcreateserial \
-out $DOMAIN_NAME.crt -days 825 -sha256 -extfile $DOMAIN_NAME.ext
