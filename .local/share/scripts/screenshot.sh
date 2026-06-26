#!/usr/bin/env bash
slurp | xargs -I{} grim -g {} - | wl-copy

