require 'sinatra'

class App < Sinatra::Base

  get '/' do
    # This should be changed when you're in production environment
    @gateway_url = "https://demo2.2c2p.com/2C2PFrontEnd/RedirectV3/payment"

    # Current version of 2C2P API
    @version = "6.0"

    # This is just a dummy value, you'll acquire this ID from 2C2P
    @merchant_id = ENV.fetch("MERCHANT_ID", "123456")

    # Your customized description of the transaction
    @payment_description = "Payment of P100.50 from Robbie Marcelo for Awesome Plan"

    # Unique merchant invoice number (20 Chars)
    @order_id = "00000000000000123456"

    # Merchant invoice number (50 Chars)
    @invoice_no = "00000000000000000000000000000000000000000000000123"

    # Price of the product (12 Chars)
    @amount = "000000010050"

    # Email for the receipt
    @customer_email = "hello@robbiemarcelo.com"

    # Merchant’s predefined payment category code for reporting purpose.
    @pay_category_id = "1001"

    # Frontend result URL to receive payment result from 2C2P.
    # Cardholder will be redirected to this URL after completing the payment in 2C2P payment gateway.
    @result_url_1 = "http://localhost:9393/test1"


    #  Backend result URL to receive payment result from 2C2P as backend response.
    #  Message is always sent back to merchant regarding user action or possible browser disconnect.
    @result_url_2 = "http://localhost:9393/test2"

    # :nodoc:
    @hash_value = "d4fd2ff42e263993c43b4b29fd1307d24dc40de0"

    erb :form
  end

  post '/test1' do
    # Redirect somewhere (e.g summary page)
  end

  post '/test2' do
    # Update order to paid success, failed, etc...
  end

end

run App
