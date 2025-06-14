#!/bin/bash

# Master Data endpoints to check
endpoints=(
  "company-code"
  "plant"
  "storage-location"
  "purchase-organization"
  "sales-organization"
  "credit-control"
  "material"
  "customer"
  "vendor"
  "work-center"
  "cost-center"
  "profit-center"
  "approval-level"
  "asset-master"
  "bom"
  "employee"
  "currency"
  "tax-code"
  "uom"
  "supply-type"
  "purchase-group"
  "country"
  "region"
)

echo "Checking Master Data Tables:"
echo "============================"
echo

for endpoint in "${endpoints[@]}"; do
  echo -n "Checking $endpoint: "
  response=$(curl -s "http://localhost:5000/api/master-data/$endpoint")
  if [[ "$response" == "null" || "$response" == "" || "$response" == "[]" ]]; then
    echo "NO DATA"
  elif [[ "$response" == *"error"* || "$response" == *"failed"* || "$response" == *"Error"* ]]; then
    echo "ERROR: $response"
  else
    # Count objects
    count=$(echo "$response" | jq '. | length')
    if [[ "$count" == "" ]]; then
      echo "ERROR: Invalid JSON response"
    else
      echo "OK - $count records"
    fi
  fi
done

echo
echo "============================"
