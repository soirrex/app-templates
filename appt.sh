#!/bin/sh

templates_dir="/usr/local/bin/app_templates"

template_name=$1
project_name=$2

# javascript
if [ "$template_name" = "javascript" ]; then
  source "$templates_dir/js/javascript.sh" "$project_name"
  exit 0
elif [ "$template_name" = "expressjs" ]; then
  source "$templates_dir/js/expressjs.sh" "$project_name"
  exit 0
elif [ "$template_name" = "fastifyjs" ]; then
  source "$templates_dir/js/fastifyjs.sh" "$project_name"
  exit 0

# typescript
elif [ "$template_name" = "typescript" ]; then
  source "$templates_dir/ts/typescript.sh" "$project_name"
  exit 0
elif [ "$template_name" = "fastifyts" ]; then
  source "$templates_dir/ts/fastifyts.sh" "$project_name"
  exit 0
elif [ "$template_name" = "expressts" ]; then
  source "$templates_dir/ts/expressts.sh" "$project_name"
  exit 0
else 
  echo "Unknown template name: $template_name"
  exit 1
fi
