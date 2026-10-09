#!/bin/sh
# LÖVE 11.5のAndroid版APKを、REAで読む。APKは実行しない。
# 使い方:
#   export REA_JADX_MCP_JAR=/path/to/jadx-headless-mcp-0.7.1-all.jar
#   sh android-love.sh love-11.5-android.apk out
set -eu
apk=$1
out=${2:-out}
mkdir -p "$out"

rea inspect-android-package "$apk" --json > "$out/package.json"
rea search-android-classes "$apk" org.love2d.android --json > "$out/classes.json"
rea inspect-android-class "$apk" org.love2d.android.GameActivity --json > "$out/gameactivity.json"
for m in onCreate handleIntent copyGameInsideArchive checkLovegameFolder getLibraries; do
  rea inspect-android-method "$apk" org.love2d.android.GameActivity "$m" --json > "$out/method_$m.json"
done
rea trace-android-references "$apk" org.love2d.android.GameActivity --method-name handleIntent --json > "$out/trace_handleIntent.json"
