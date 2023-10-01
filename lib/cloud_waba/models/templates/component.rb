# typed: true
# frozen_string_literal: true

module CloudWaba
  module Models
    module Templates
      Component = T.type_alias do
        T.any(
          ::CloudWaba::Models::Templates::HeaderTextComponent,
          ::CloudWaba::Models::Templates::HeaderMediaComponent,
          ::CloudWaba::Models::Templates::HeaderLocationComponent,
          ::CloudWaba::Models::Templates::BodyComponent,
          ::CloudWaba::Models::Templates::FooterComponent,
          ::CloudWaba::Models::Templates::ButtonsComponent,
        )
      end
    end
  end
end
