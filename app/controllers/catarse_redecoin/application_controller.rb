module CatarseRedecoin
  class ApplicationController < ActionController::Base
    before_filter :authenticate_user!
    layout :false

    protected
    def raven_capture exception
      ::Raven.user_context(
        {
          contribution_id: payment.contribution_id,
          user_id: contribution.user_id,
          payment_key: payment.key,
          project_id: contribution.project_id,
          payment_method: payment.payment_method
        }
      )
      ::Raven.capture_exception(exception)
      ::Raven.user_context({})
    end

    def authenticate_user!
      unless defined?(current_user) && current_user
        raise Exception.new('invalid user')
      end

      if current_user != contribution.user
        raise Exception.new('invalid user') unless current_user.admin?
      end
    end

    def contribution
      @contribution ||= PaymentEngines.find_contribution(params[:id])
    end

    def payment
      attributes = {contribution: contribution, value: contribution.value}
      @payment ||= PaymentEngines.new_payment(attributes)
    end

  end
end
