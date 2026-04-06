source /usr/local/bin/app_templates/utils/ts-js/eslint.sh
source /usr/local/bin/app_templates/utils/ts-js/prettier.sh

project_name=$1

mkdir $project_name
cd $project_name

npm init -y
npm i fastify

generate_eslint_js
generate_prettier

new_json_content=$(cat ./package.json | \
  sed -e 's|"scripts": *{|&\
    "start": "node src/index.js",|' \
  -e 's|"scripts": *{|&\
    "dev": "node --watch --watch-path=src src/index.js",|' \
  -e 's|"scripts": *{|&\
    "format": "prettier --write 'src/**/*.js'",|' \
  -e 's|"scripts": *{|&\
    "lint": "eslint 'src/**/*.js' --fix",|' \
  -e 's|"type": *"commonjs"|"type": "module"|')

echo "$new_json_content" > ./package.json

mkdir src
echo 'import Fastify from "fastify";

const fastify = Fastify({
  logger: true,
});

fastify.listen({ port: 3000 }, (err) => {
  if (err) {
    fastify.log.error(err);
  }
});' > src/index.js
