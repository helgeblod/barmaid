require 'sinatra'
require 'barby'
require 'barby/barcode/ean_13'
require 'barby/outputter/png_outputter'
require 'base64'

get '/' do
  erb :index
end

post '/result' do
  barcode = Barby::EAN13.new(params["barcode"][0..-2])
  barcode_png_base64 = Base64.encode64(Barby::PngOutputter.new(barcode).to_png)
  erb :result, locals: {barcode_base64: barcode_png_base64}
end
