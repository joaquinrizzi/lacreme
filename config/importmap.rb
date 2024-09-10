# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "bootstrap", to: 'bootstrap.min.js', preload: true
pin "@popperjs/core", to: "popper.js", preload: true
pin "flatpickr" # @4.6.13

# pin "popper", to: 'popper.js', preload: true

# pin "bootstrap" # @5.3.3
# pin "@popperjs/core", to: "@popperjs--core.js" # @2.11.8
# pin "bootstrap", to: "https://ga.jspm.io/npm:bootstrap@5.3.2/dist/js/bootstrap.esm.js"
# pin "@popperjs/core", to: "https://ga.jspm.io/npm:@popperjs/core@2.11.8/lib/index.js"
# pin "bootstrap", to: "https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
# pin "@popperjs/core", to: "https://unpkg.com/@popperjs/core@2.9.2/dist/umd/popper.min.js"
