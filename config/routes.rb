Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace 'api' do
    namespace 'v1' do
      resources :configs
      post '/payouts', to: 'payouts#calculate_paysheet'
    end
  end
end
