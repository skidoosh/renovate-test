ARG PYTHON_VERSION=3.14.7-alpine3.24@sha256:05b2b8b732ecd268fee8727a369f936f022d1321b59befd13c30ede22769dcdc

FROM python:${PYTHON_VERSION} AS base

COPY --from=ghcr.io/astral-sh/uv:0.12.6-python3.14-alpine3.23@sha256:3f43dc141a3a7e61948cc4c22e0a52666e80ef35ffe6c73e03d60e073b655327 /uv /uvx /bin/
