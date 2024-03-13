# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "loading", to: "loading.js"
pin "menubar", to: "menubar.js"
pin "article", to: "article.js"
pin "revert_check", to: "revert_check.js"