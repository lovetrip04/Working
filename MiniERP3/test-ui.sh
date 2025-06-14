#!/bin/bash

# UI Test Runner Script for MiniERP
# This script simplifies running different types of UI tests

# Make the script executable if it's not already
if [ ! -x "$0" ]; then
  chmod +x "$0"
fi

# Show help message
show_help() {
  echo "MiniERP UI Test Runner"
  echo ""
  echo "Usage:"
  echo "  ./test-ui.sh [command] [options]"
  echo ""
  echo "Commands:"
  echo "  all                Run all UI tests"
  echo "  page <route>       Test a specific page (e.g. /master-data/bom)"
  echo "  feature <feature>  Test a specific feature (buttons, scrolling, data-loading)"
  echo "  help               Show this help message"
  echo ""
  echo "Examples:"
  echo "  ./test-ui.sh all"
  echo "  ./test-ui.sh page /master-data/bom"
  echo "  ./test-ui.sh feature buttons"
}

# No arguments, show help
if [ $# -eq 0 ]; then
  show_help
  exit 0
fi

# Parse commands
command=$1
shift

case $command in
  all)
    echo "Running all UI tests..."
    node tests/run-tests.js all
    ;;
  page)
    if [ $# -eq 0 ]; then
      echo "Error: You must specify a page route"
      echo "Example: ./test-ui.sh page /master-data/bom"
      exit 1
    fi
    
    page_route=$1
    echo "Testing page: $page_route"
    node tests/run-tests.js page "$page_route"
    ;;
  feature)
    if [ $# -eq 0 ]; then
      echo "Error: You must specify a feature"
      echo "Example: ./test-ui.sh feature buttons"
      exit 1
    fi
    
    feature=$1
    echo "Testing feature: $feature"
    node tests/run-tests.js feature "$feature"
    ;;
  help)
    show_help
    ;;
  *)
    echo "Unknown command: $command"
    show_help
    exit 1
    ;;
esac

# Make the script executable
chmod +x "$0"