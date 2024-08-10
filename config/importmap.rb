# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "jquery", to: "https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
pin "@nathanvda/cocoon", to: "https://cdnjs.cloudflare.com/ajax/libs/jquery.cocoon/1.2.14/jquery.cocoon.js"
