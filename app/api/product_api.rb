require 'grape-roar'
require 'helpers/params_helper'

class ProductApi < Grape::API
  rescue_from :all do |e|
    error_response(message: {
                       type:   'http://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html',
                       title:  e.message
                   },
                   headers: { 'Content-Type' => 'application/problem+json' })
  end

  format :json
  formatter :json, Grape::Formatter::Roar
  content_type :json, 'application/hal+json'

  helpers ParamsHelper

  desc 'return all products'
  get '/' do
    ProductsPresenter.new(ProductRepository.list)
  end

  route_param :id do

    params do
      requires :id,       type: Integer, allow_blank: false
    end

    desc 'return one product by id'
    get do
      ProductPresenter.new(ProductRepository.find(params[:id]))
    end
  end

end
