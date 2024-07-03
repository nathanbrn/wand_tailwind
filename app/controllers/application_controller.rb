class ApplicationController < ActionController::Base
  inertia_share flash: -> { flash.to_hash }
end
