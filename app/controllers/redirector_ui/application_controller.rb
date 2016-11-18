require 'font-awesome-rails'

module RedirectorUi
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
  end
end
