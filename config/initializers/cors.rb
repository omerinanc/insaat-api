Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins "https://omerinanc.online/"
      resource "*", headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true
    end
  
    allow do
      origins "https://link-to-production-app.com/"
      resource "*", headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true
    end
  end