#!/bin/sh

templates_dir="/usr/local/bin/app_templates"

param=$1
sub_param=$2

# commands
if [ "$param" = "help" ]; then
  echo ""
  echo "To create a project template, enter: 'appt [template_name] [project_name]'"
  echo "Example: appt javascript myapp"
  echo ""
  echo "To get a list of all templates, enter: 'appt list' or 'appt list [language]'"
  echo ""

  exit 0
elif [ "$param" = "list" ] && [ -z "$sub_param" ]; then
  echo ""
  for d in "$templates_dir"/*; do
    name="${d##*/}"
    echo "$name:"
    for t in "$templates_dir/$name"/*; do
      t_name=${t%.sh}
      echo "  ${t_name##*/}"
    done
    echo ""
  done

  exit 0
elif [ "$param" = "list" ] && [ -n "$sub_param" ]; then
  echo ""
  echo "$sub_param:"
  for t in "$templates_dir/$sub_param"/*; do
      name=${t%.sh}
      echo "  ${name##*/}"
  done
  echo ""

  exit 0
fi

# create templates
template_name="$param"
project_name="$sub_param"

if [ -z "$template_name" ] || [ -z "$project_name" ]; then 
  echo "Incorrect parameters specified, use 'appt help'"
  exit 1
fi

# javascript
if [ "$template_name" = "javascript" ]; then
  source "$templates_dir/javascript/javascript.sh" "$project_name"
  exit 0
elif [ "$template_name" = "expressjs" ]; then
  source "$templates_dir/javascript/expressjs.sh" "$project_name"
  exit 0
elif [ "$template_name" = "fastifyjs" ]; then
  source "$templates_dir/javascript/fastifyjs.sh" "$project_name"
  exit 0

# typescript
elif [ "$template_name" = "typescript" ]; then
  source "$templates_dir/typescript/typescript.sh" "$project_name"
  exit 0
elif [ "$template_name" = "fastifyts" ]; then
  source "$templates_dir/typescript/fastifyts.sh" "$project_name"
  exit 0
elif [ "$template_name" = "expressts" ]; then
  source "$templates_dir/typescript/expressts.sh" "$project_name"
  exit 0
else 
  echo "Unknown template name: $template_name"
  exit 1
fi
