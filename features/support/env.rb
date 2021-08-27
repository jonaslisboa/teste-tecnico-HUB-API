require "httparty"
require "pry"
require "cucumber"
require "json"
require "neatjson"

CONFIG_UI = YAML.load_file "./features/support/fakeRESTApi_web_V1.yml"