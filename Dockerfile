ARG PYTHON_VERSION=3.14.7-alpine3.24@sha256:9e9fde4d32eedce0b661d9ab91e826b62dddf28e928c230ec55f1866cac66b01

FROM python:${PYTHON_VERSION} AS base

COPY --from=ghcr.io/astral-sh/uv:0.12.23-python3.14-alpine3.23@sha256:5bad981cb914722a38eb1f9de538194f14d03c5f104d3b30f19239327d57eb50 /uv /uvx /bin/
