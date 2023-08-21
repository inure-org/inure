# esse arquivo é utilizado pelos servidores rack para inicializar o aplicativo.

require ::File.expand_path('../config/environment', __FILE__)

run Inure::Application
