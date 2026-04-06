source /usr/local/bin/app_templates/utils/ts-js/eslint.sh
source /usr/local/bin/app_templates/utils/ts-js/prettier.sh
source /usr/local/bin/app_templates/utils/ts-js/tsconfig.sh

project_name=$1

mkdir $project_name
cd $project_name

npm init -y
npm i fastify

generate_eslint_ts
generate_prettier

new_json_content=$(cat ./package.json | \
  sed -e 's|"scripts": *{|&\
    "start": "node dist/index.js",|' \
  -e 's|"scripts": *{|&\
    "build": "npx tsc",|' \
  -e 's|"scripts": *{|&\
    "dev": "node --import jiti/register --watch --watch-path=src src/index.ts",|' \
  -e 's|"scripts": *{|&\
    "format": "prettier --write 'src/**/*.ts'",|' \
  -e 's|"scripts": *{|&\
    "lint": "eslint 'src/**/*.ts' --fix",|' \
  -e 's|"type": *"commonjs"|"type": "module"|')

echo "$new_json_content" > ./package.json

generate_tsconfig

mkdir src
echo 'import Fastify from "fastify";

const fastify = Fastify({
  logger: true,
});

fastify.listen({ port: 3000 }, (err) => {
  if (err) {
    fastify.log.error(err);
  }
});' > src/index.ts
