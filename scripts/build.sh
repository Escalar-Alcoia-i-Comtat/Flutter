#!/usr/bin/env shell

# COLOR CONSTANTS
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
BLUE=$(tput setaf 4)
GRAY=$(tput setaf 6)
NC=$(tput sgr0) # No Color

echo "${BLUE}INFO$GRAY > ${NC}Loading project builder..."

OK_PREFIX="${GREEN}OK   $GRAY > ${NC}"
INFO_PREFIX="${BLUE}INFO $GRAY > ${NC}"
ERROR_PREFIX="${RED}ERROR$GRAY > ${NC}"

BASEDIR=$(dirname "$0")
FLUTTER_PROJECT_DIR=$(dirname "$BASEDIR/../eaic_flutter")

echo "${BLUE}INFO$GRAY > ${NC}Flutter project directory: $FLUTTER_PROJECT_DIR"
cd "$FLUTTER_PROJECT_DIR" # || echo "${ERROR_PREFIX}Could not find the Flutter project" && exit

echo "${OK_PREFIX}Accessed Flutter project dir."
echo "${INFO_PREFIX}Building Flutter project..."

flutter build web --web-renderer canvaskit --release

echo "${INFO_PREFIX}Finished building project."

cp -r --remove-destination "$FLUTTER_PROJECT_DIR/build/web/*" "$FLUTTER_PROJECT_DIR/../eaic_mobile"
