# typed: true
# frozen_string_literal: true

require 'pry'

module CloudWaba
  module Models
    module Templates
      class Response < T::Struct
        extend ::T::Sig
        extend ::T::Helpers
        # "{\"id\":\"838949364353910\",\"status\":\"PENDING\",\"category\":\"MARKETING\"}"
        prop :id, ::String
        prop :status, ::String
        prop :category, ::CloudWaba::Models::Enums::Templates::Category

        sig { params(response: ::HTTP::Response).returns(::CloudWaba::Models::Templates::Response) }
        def self.parse(response:)
          parsed_response = JSON.parse(response.body.to_s)
          category = ::CloudWaba::Models::Enums::Templates::Category.deserialize(parsed_response["category"])

          self.new(
            id: parsed_response["id"],
            status: parsed_response["status"],
            category: category
          )
        end
      end
    end
  end
end
