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

echo "MASTER DATA TABLES ANALYSIS"
echo "==========================="
echo
echo "Tables missing data or with errors:"
echo "---------------------------------"

for endpoint in "${endpoints[@]}"; do
  response=$(curl -s "http://localhost:5000/api/master-data/$endpoint")
  
  # Check if response is empty array, null, or empty string
  if [[ "$response" == "null" || "$response" == "" || "$response" == "[]" ]]; then
    echo "❌ $endpoint: No data"
  # Check if response contains error messages
  elif [[ "$response" == *"error"* || "$response" == *"failed"* || "$response" == *"Error"* ]]; then
    echo "❌ $endpoint: Error in response"
  else
    # Count objects
    count=$(echo "$response" | jq '. | length')
    if [[ "$count" == "" ]]; then
      echo "❌ $endpoint: Invalid JSON response"
    elif [[ "$count" -eq 0 ]]; then
      echo "❌ $endpoint: Empty array (0 records)"
    fi
  fi
done

echo
echo "Tables with data:"
echo "-----------------"

for endpoint in "${endpoints[@]}"; do
  response=$(curl -s "http://localhost:5000/api/master-data/$endpoint")
  
  if [[ "$response" != "null" && "$response" != "" && "$response" != "[]" && 
        "$response" != *"error"* && "$response" != *"failed"* && "$response" != *"Error"* ]]; then
    # Count objects
    count=$(echo "$response" | jq '. | length')
    if [[ "$count" != "" && "$count" -gt 0 ]]; then
      echo "✅ $endpoint: $count records"
    fi
  fi
done
