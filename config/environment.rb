# carregar a aplicação rails
require File.expand_path('../application', __FILE__)

# inicializar a aplicação rails
Inure::Application.initialize!

require File.join(Rails.root, "lib", "gitosis")
