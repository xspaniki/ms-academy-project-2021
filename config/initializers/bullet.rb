Rails.application.configure do
  if Rails.env.development? || Rails.env.test?
    config.after_initialize do
      Bullet.enable  = true
      Bullet.console = true
    end
  end
end
