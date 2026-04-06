generate_tsconfig() {
  npm i -D typescript @types/node
  npx tsc --init

  tsconfig_content=$(cat ./tsconfig.json)
  new_tsconfig_content=$(echo "$tsconfig_content" \
  | sed 's/\/\/\s*"rootDir"/"rootDir"/' \
  | sed 's/\/\/\s*"outDir"/"outDir"/' \
  | sed 's/\/\/\s*"lib"/"lib"/' \
  | sed 's/\/\/\s*"types"/"types"/' \
  | sed 's/"compilerOptions":\s*{/"compilerOptions": {\n    "include": ["src\/\*\*\/\*.ts"],/' )

  echo "$new_tsconfig_content" > ./tsconfig.json
}


