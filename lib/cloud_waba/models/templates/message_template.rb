# typed: true
# frozen_string_literal: true

module CloudWaba
  module Models
    module Templates
      class MessageTemplate < T::Struct
        prop :name, ::String
        prop :language, ::String
        prop :components, ::T::Array[::CloudWaba::Models::Templates::Component]
      end
    end
  end
end
