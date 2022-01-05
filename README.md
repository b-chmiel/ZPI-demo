# ZPI-demo

The authentication and authorization system with access
management system, adaptive 2FA and OAuth2.0 implementation.

## Clone

`git clone --recurse-submodules https://github.com/bachm44/ZPI-demo.git`

or

`git clone --recurse-submodules git@github.com:bachm44/ZPI-demo.git`

## Requirements

- docker deamon running

## Run

`make`

In order to add user, use https://ams.zpi.fuf.me.

Password for newly created account is sent to email address
provided during registration.

For convenience sake `./seed.py` seeds default user and
Client. Password is sent to user@zpi.com. Mail client
configuration is described [here](#mail-server).

## Available services

### Authentication library

The library provides authorize button used in demo application. The button
redirects to authentication page with appropriate parameters.

Source code: https://github.com/bachm44/ZPI-authorize-lib

### Load balancer & Reverse Proxy

Services are hosted using Nginx with the use of `fuf.me` domain conveniently
pointing to 127.0.0.1. For more information see `proxy/nginx.conf`.

The system uses `https` protocol with self signed SSL certificates. The
project provides sample certificates inside `proxy/certs/out`.
Those certificates should be imported in the browser of
your choice. In order to generate new certificates use
`make cert` command.

Configuration available inside `proxy` directory.

### Demo application (https://demo.zpi.fuf.me)

The demo application (Client) consists of authorize button used for obtaining
access token by the user.

Source code:

- frontend - https://github.com/bachm44/ZPI-demo-UI

### Access management system (https://ams.zpi.fuf.me)

The access management system (AMS) is responsible for access, role and user
management through admin console.

Credentials:

- username: admin
- password: admin

Source code:

- backend - https://github.com/Maciag312/ZPI-AMS-service
- frontend - https://github.com/Maciag312/ZPI-AMS-UI

### Authentication and authorization server (https://auth.zpi.fuf.me)

The authentication and authorization server responsible for authentication
of user
and authorization of Client. Authentication button redirects to this domain
with appropriate parameters.

Source code:

- backend - https://github.com/bachm44/ZPI-authorize-service
- frontend - https://github.com/bachm44/ZPI-authorize-UI

### pgAdmin (https://pgadmin.zpi.fuf.me)

Use to access raw analysis data.

Credentials:

- username: admin@zpi.com
- password: admin

### Grafana (https://grafana.zpi.fuf.me)

Visualisation of analysis data.

Credentials:

- username: admin
- password: admin

Configuration available inside `grafana` directory.

### Mail server

Mail client configuration:

- port: 587
- domain: localhost
- authenticationMethod: password
- connectionSecurity: none

Registered accounts:

- user

  - username: user@zpi.com
  - password: admin

- admin
  - username: admin@zpi.com
  - password: admin

Server configuration available inside `docker-mailserver` and `docker-compose.yaml`.
