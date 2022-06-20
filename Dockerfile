ARG BASE_IMAGE

# ------------------------
# Target: dev
# ------------------------
FROM $BASE_IMAGE as dev

ARG TOOLKIT_USER_ID=13011
ARG TOOLKIT_GROUP_ID=13011

RUN apt-get update \
    # Required to save git hashes
    && apt-get install -y -q git curl unzip make gettext \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
ENV XDG_DATA_HOME=/app/.local/share \
    XDG_CACHE_HOME=/app/.cache \
    XDG_BIN_HOME=/app/.local/bin \
    XDG_CONFIG_HOME=/app/.config
RUN mkdir -p $XDG_DATA_HOME \
    && mkdir -p $XDG_CACHE_HOME \
    && mkdir -p $XDG_BIN_HOME \
    && mkdir -p $XDG_CONFIG_HOME \
    && chown -R $TOOLKIT_USER_ID:$TOOLKIT_GROUP_ID /app

# ------------------------
# Target: eval
# ------------------------
FROM dev as eval

ARG TOOLKIT_USER_ID=13011
ARG TOOLKIT_GROUP_ID=13011