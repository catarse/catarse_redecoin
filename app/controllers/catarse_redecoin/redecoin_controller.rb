module CatarseRedecoin
  class RedecoinController < CatarseRedecoin::ApplicationController
    def create
      response = Typhoeus::Request.new(
         "https://api.redecoin.com/v1/transacao/criar",
         method: :get,
         params: {
           token: CatarseRedecoin.configuration.token,
           amount: contribution.value.to_f,
           iso4217: "BRL",
           email_client: contribution.user.email,
           refer_id: contribution.id
         }
      ).run

      if response.success?
        json_response = ActiveSupport::JSON.decode(response.body)
        if [100, 110, 120].include?(json_response['status'])
          coin_resp = json_response['resp']

          payment.update_attributes(
            gateway: 'Redecoin',
            gateway_id: coin_resp['token'],
            gateway_data: coin_resp,
            payment_method: 'Bitcoin'
          )
          if payment.save
            render json: {
              id: payment.id,
              gateway_id: coin_resp['token'],
              qrcode: coin_resp['qrcode'],
              amount_btc: coin_resp['valBtc'],
              amount_blr: payment.value.to_f
            }, status: 200
          else
            render json: { errors: payment.errors.to_json }, status: 400
          end
        end
      else
        render json: { errors: 'request error'}, status: 400
      end
    end
  end
end
