# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- `consul-bootstrap-init-secret` & `consul-global-token-secret` with consul acl tokens
- DC2 under 2-dc2
- DC into loki labels

### Changed

- Changing to Consul Ent
- Changing to 1.20-ent from 1.19
- Moved 1-Standard to 1-dc1

### Removed

## [0.0.1]

### Added

- ServiceAccount and Role for creating k8s secrets
- `consul-acl-bootstrap` job to bootstrap console

### Changed

- Enabling ACL
- `consul-client` deployment now uses console root token

## [0.0.0] - 2024-11-26

### Added

- Monitoring
- Consul server x3 with a basic setup
- Counting Service and agent


