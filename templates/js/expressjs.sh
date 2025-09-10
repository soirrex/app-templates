project_name=$1

mkdir $project_name
cd $project_name

npm init -y
npm i express
npm i -D prettier nodemon

echo '{
  "watch": ["src"],
  "ext": "js",
  "exec": "node src/index.js"
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
  | sed 's/"scripts":\s*{/"scripts": {\n    "start": "node src\/index.js",/' \
  | sed 's/"scripts":\s*{/"scripts": {\n    "dev": "nodemon",/' \
  | sed 's/"type":\s*"commonjs"/"type": "module"/')

echo "$new_json_content" > ./package.json

mkdir src
echo 'import express from "express";

const app = express();

app.use(express.json());

const PORT = 3000;
app.listen(PORT, () => {
  console.log(`Server was running on port: ${PORT}`);
});' > src/index.js
