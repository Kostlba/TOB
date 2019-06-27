# frozen_string_literal: true

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
Status.create!(name: 'Готово')
Status.create!(name: 'Очікуйте, в наближчий час буде готово')
Status.create!(name: 'Не готово')
