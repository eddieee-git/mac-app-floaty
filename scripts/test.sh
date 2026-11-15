#!/bin/zsh
# 자동 점검을 돌린다. Xcode 없이 Command Line Tools만으로 돌아가도록 앱 안의 --self-test 모드를 쓴다.
set -e
cd "$(dirname "$0")/.."
swift build
.build/debug/Floaty --self-test
