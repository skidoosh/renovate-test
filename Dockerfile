ARG PYTHON_VERSION=3.14.1-alpine3.21@sha256:fd8407cacb1028c803566276ae25eb7c2a00fbaa210a0a5670994f6866e29278

FROM python:${PYTHON_VERSION} AS base

COPY --from=ghcr.io/astral-sh/uv:0.12.6-python3.14-alpine3.23@sha256:3f43dc141a3a7e61948cc4c22e0a52666e80ef35ffe6c73e03d60e073b655327 /uv /uvx /bin/
