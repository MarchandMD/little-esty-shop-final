class WelcomeController < ApplicationController
  def index
    @hello_world = File.read('welcome.md')
  end
end
