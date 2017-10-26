class ConfirmationsController < ApplicationController
skip_before_action :authenticate_user!
def show

end

private
  def after_confirmation_path_for(resource_name, resource)
    root_path
  end

end
