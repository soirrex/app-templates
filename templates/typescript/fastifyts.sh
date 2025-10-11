project_name=$1

mkdir $project_name
cd $project_name

npm init -y
npm i fastify
npm i -D prettier typescript @types/node nodemon

npx tsc --init

echo '{
  "watch": ["src"],
  "ext": "ts",
  "exec": "npx tsx src/index.ts"
}' > nodemon.json

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
  | sed 's/"scripts":\s*{/"scripts": {\n    "start": "node dist\/index.js",/' \
  | sed 's/"scripts":\s*{/"scripts": {\n    "build": "npx tsc",/' \
  | sed 's/"scripts":\s*{/"scripts": {\n    "dev": "nodemon",/' \
  | sed 's/"type":\s*"commonjs"/"type": "module"/' )

echo "$new_json_content" > ./package.json

tsconfig_content=$(cat ./tsconfig.json)
new_tsconfig_content=$(echo "$tsconfig_content" \
  | sed 's/\/\/\s*"rootDir"/"rootDir"/' \
  | sed 's/\/\/\s*"outDir"/"outDir"/' \
  | sed 's/\/\/\s*"lib"/"lib"/' \
  | sed 's/\/\/\s*"types"/"types"/' \
  | sed 's/"compilerOptions":\s*{/"compilerOptions": {\n    "include": ["src\/\*\*\/\*.ts"],/' )

echo "$new_tsconfig_content" > ./tsconfig.json

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
