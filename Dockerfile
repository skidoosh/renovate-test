ARG PYTHON_VERSION=3.14.7-alpine3.24@sha256:05b2b8b732ecd268fee8727a369f936f022d1321b59befd13c30ede22769dcdc

FROM python:${PYTHON_VERSION} AS base

COPY --from=ghcr.io/astral-sh/uv:0.12.7-python3.14-alpine3.23@sha256:1f178a7bcca4ada7464ca87f17a0a27a9f077ee1e22e47d8937259502871f074 /uv /uvx /bin/
