FROM derailed/k9s:latest

RUN apk add --no-cache neovim

ENV KUBE_EDITOR=nvim \
    EDITOR=nvim
