# typed: true
# frozen_string_literal: true

module CloudWaba
  module Models
    module Templates
      Component = T.type_alias do
        T.any(
          ::CloudWaba::Models::Templates::HeaderComponent,
          ::CloudWaba::Models::Templates::BodyComponent,
          ::CloudWaba::Models::Templates::FooterComponent,
          ::CloudWaba::Models::Templates::ButtonsComponent,
        )
      end
    end
  end
end
