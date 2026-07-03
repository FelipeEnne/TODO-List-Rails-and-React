# frozen_string_literal: true

Rails.application.config.to_prepare do
  ActiveStorage::Blobs::ProxyController.class_eval do
    before_action { response.headers["Cache-Control"] = "no-store" }
  end
end
