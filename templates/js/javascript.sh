project_name=$1

mkdir $project_name
cd $project_name

npm init -y
npm i -D prettier

echo '{
  "semi": true,
  "singleQuote": false,
  "trailingComma": "all",
  "printWidth": 100,
  "tabWidth": 2,
  "useTabs": false,
  "arrowParens": "always"
}' > .prettierrc

json_content=$(cat ./package.json)

new_json_content=$(echo "$json_content" \
  | sed 's/"scripts":\s*{/"scripts": {\n    "start": "node src\/index.js",/' \
  | sed 's/"type":\s*"commonjs"/"type": "module"/')

echo "$new_json_content" > ./package.json

mkdir src
touch src/index.js
