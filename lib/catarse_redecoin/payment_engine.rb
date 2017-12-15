module CatarseRedecoin
  class PaymentEngine
    def name
      'Redecoin'
    end

    def review_path contribution
    end

    def locale
      'pt'
    end

    def can_do_refund?
      false
    end

    def direct_refund contribution
      false
    end

    def transfer contribution
      false
    end

    def can_generate_second_slip?
      false
    end

    def second_slip_path(payment)
      # The second slip generates a new payment base on the contribution ID
      false
    end

    protected

    def url_helpers
      CatarseRedecoin::Engine.routes.url_helpers
    end
  end
end

