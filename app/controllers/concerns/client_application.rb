module ClientApplication
  extend ActiveSupport::Concern

  included do
    before_action :include_client_application
  end

  private
  def include_client_application
    @client_application = true
  end
end
