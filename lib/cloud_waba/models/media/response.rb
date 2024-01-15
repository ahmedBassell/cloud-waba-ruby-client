# typed: true
# frozen_string_literal: true

module CloudWaba
  module Models
    module Media
      class Response < T::Struct
        extend ::T::Sig
        extend ::T::Helpers
        ##
        # {
        #   "messaging_product": "whatsapp",
        #   "url": "<URL>",
        #   "mime_type": "<MIME_TYPE>",
        #   "sha256": "<HASH>",
        #   "file_size": "<FILE_SIZE>",
        #   "id": "<MEDIA_ID>"
        # }
        prop :messaging_product, ::CloudWaba::Models::Enums::MessagingProduct
        prop :url, ::String
        prop :mime_type, ::String
        prop :sha256, ::String
        prop :file_size, ::Integer
        prop :id, ::String

        sig { params(hash: ::T::Hash[::T.untyped, ::T.untyped]).returns(::CloudWaba::Models::Media::Response) }
        def self.parse(hash:)
          id = hash["id"]
          url = hash["url"]
          mime_type = hash["mime_type"]
          sha256 = hash["sha256"]
          file_size = hash["file_size"]

          self.new(
            messaging_product: ::CloudWaba::Models::Enums::MessagingProduct::WhatsApp,
            url: url,
            mime_type: mime_type,
            sha256: sha256,
            file_size: file_size,
            id: id,
          )
        end
      end
    end
  end
end