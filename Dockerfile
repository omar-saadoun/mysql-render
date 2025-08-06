FROM oraclelinux:8

# Enable root and install Python and pip
RUN dnf install -y python39 python39-pip && \
    python3.9 -m pip install --upgrade pip && \
    python3.9 -m pip install magic-wormhole

FROM mysql:8.0  # or from registry.access.redhat.com/…
# Copy Python and pip from the builder stage
COPY --from=0 /usr/bin/python3.9 /usr/bin/python3.9
COPY --from=0 /usr/local/lib/python3.9 /usr/local/lib/python3.9
# Note: you may need more copying depending on paths

