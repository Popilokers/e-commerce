# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"

# config/importmap.rb
pin "paypal", to: "https://www.paypal.com/sdk/js?client-id=AbdskrA24ugeb6yHnUw4JpaamGHjobDxwjKL2TMWAfJGScco13CsGNxZm0FrVyXfihV--6Rm3q5_OQiM&currency=USD&components=buttons"
