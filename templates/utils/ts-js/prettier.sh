generate_prettier() {
  npm i -D prettier

  echo '{
  "semi": true,
}' > .prettierrc
}


