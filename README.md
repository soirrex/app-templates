# Bash script for creating project templates

**Only support nodejs templates, but i may add other languages and templates in the future.**

A Bash script that automatically generates a starter template for projects so you don't have to do it manually every time.

## Install

1. **Clone the Repository**

   ```bash
   git clone https://github.com/aqugxs/app-templates.git
   ```

2. **Navigate to the Project Folder**

   ```bash
   cd app-templates
   ```

3. **Install project**

   ```bash
   sudo make install
   ```

## Uninstall

1. **Navigate to the Project Folder**

   ```bash
   cd app-templates
   ```

2. **Remove CLI**

   ```bash
   sudo make uninstall
   ```

3. **Remove folder with this project**
   ```bash
   rm -rf app-templates
   ```
4. OR
   ```bash
   sudo rm -rf /usr/local/bin/appt
   sudo rm -rf /usr/local/bin/app_templates
   ```

## How to use it?

`appt [template name] [project name]`

**exapmle:** `appt typescript myapp`

## What templates does this script support? <a id="templates"></a>

- **TypeScript:**
  - **typescript**: Vanila TypeScript project
  - **expressts**: Express project with TypeScript
  - **fastifyts**: Fastify project with TypeScript
- **JavaScript:**
  - **javascript**: Vanila JavaScript project
  - **expressjs**: Express project with JavaScript
  - **fastifyjs**: Fastify project with JavaScript
