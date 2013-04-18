require "sitegen"

tools = require "sitegen.tools"

sitegen.create_site =>
  @current_version = "0.0.2"
  @title = "Lapis"

  scssphp = tools.system_command "pscss < %s > %s", "css"
  coffeescript = tools.system_command "coffee -c -s < %s > %s", "js"

  build scssphp, "style.scss", "style.css"
  build coffeescript, "main.coffee", "main.js"

  deploy_to "leaf@leafo.net", "www/lapis/"

  add "lapis/docs/reference.md", target: "reference"
