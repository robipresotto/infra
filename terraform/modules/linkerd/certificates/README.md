# Generateting the certificates
Generate the following certificates inside of the `linkerd/certificate` folder.

### Trust anchor certificate
```sh
step certificate create root.linkerd.cluster.local ca.crt ca.key \
--profile root-ca --no-password --insecure
```

### Issuer certificate and key
```sh
step certificate create identity.linkerd.cluster.local issuer.crt issuer.key \
--profile intermediate-ca --not-after 8760h --no-password --insecure \
--ca ca.crt --ca-key ca.key
```