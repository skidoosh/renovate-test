ARG PYTHON_VERSION=3.14.0-alpine3.21@sha256:f1ac9e01293a18a24919826ea8c7bb8f7bbc25497887a0a1cade58801bb83d1c

FROM python:${PYTHON_VERSION} AS base

COPY --from=ghcr.io/astral-sh/uv:0.12.0-python3.14-alpine3.23@sha256:9c2e8c54545d6402b1b6995e6bfb3969afccf9f2380b1d5d0cec0756e8aec1a3 /uv /uvx /bin/
