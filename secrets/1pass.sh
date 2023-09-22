#!/bin/bash

# Fetch kubeconfig data
echo "{{ op://dotfiles/k8s-kubeconfig/k8s-kubeconfig.yaml }}" > ~/.kube/config

# Fetch copilot data
echo "{{ op://dotfiles/github-copilot/hosts.json }}" > ~/.config/github-copilot/hosts.json

# Fetch sourcery data
echo "{{ op://dotfiles/sourcery/auth.yaml }}" > ~/.config/sourcery/auth.yaml
