module UsersDevise
  extend ActiveSupport::Concern

  included do
    layout 'devise/application' # Set the layout for all actions in this module
  end
end
