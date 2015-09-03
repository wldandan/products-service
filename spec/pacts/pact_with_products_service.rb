Pact.service_provider 'Products Service' do
  honours_pact_with 'Contracts Service' do
    pact_uri '../products-service/spec/pacts/contracts_service-products_service.json'
  end
end

Pact.provider_states_for 'Contracts Service' do
  provider_state 'products exist' do
    set_up do
    end
  end
end
