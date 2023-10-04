# typed: true
# frozen_string_literal: true

# require 'pry'

module CloudWaba
  module Models
    module Templates
      class Response < T::Struct
        extend ::T::Sig
        extend ::T::Helpers
        # "{\"id\":\"838949364353910\",\"status\":\"PENDING\",\"category\":\"MARKETING\"}"
        prop :id, ::T.nilable(::String)
        prop :status, ::T.nilable(::String)
        prop :category, ::T.nilable(::CloudWaba::Models::Enums::Templates::Category)
        prop :language, ::T.nilable(::String)
        prop :name, ::T.nilable(::String)

        sig { params(template_hash: ::T::Hash[::T.untyped, ::T.untyped]).returns(::CloudWaba::Models::Templates::Response) }
        def self.parse(template_hash:)
          category = ::CloudWaba::Models::Enums::Templates::Category.try_deserialize(template_hash["category"])

          self.new(
            id: template_hash["id"],
            status: template_hash["status"],
            category: category,
            language: template_hash["language"],
            name: template_hash["name"]
          )
        end
      end
    end
  end
end
