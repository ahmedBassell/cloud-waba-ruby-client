# typed: true
# frozen_string_literal: true

require "http"

module CloudWaba
  class HttpClient
    attr_accessor :base_url
    attr_accessor :auth_token

    def initialize(base_url:, auth_token:)
      @base_url = base_url
      @auth_token = auth_token
    end

    def get(headers: {}, params: {})
      client = http_client.headers(headers)
      client = client.auth("Bearer #{@auth_token}") unless @auth_token.nil?
      response = client.get(@base_url, ssl_context: ssl_ctx, params: params)
    end

    def post(headers: {}, body:)
      client = http_client.headers(headers)
      client = client.auth("Bearer #{@auth_token}") unless @auth_token.nil?
      response = client.post(@base_url, ssl_context: ssl_ctx, json: body)
    end

    def put(headers: {}, body:)
      client = http_client.headers(headers)
      client = client.auth("Bearer #{@auth_token}") unless @auth_token.nil?
      response = client.put(@base_url, ssl_context: ssl_ctx, json: body.to_json)
    end

    def delete(headers:{}, params:{})
      client = http_client.headers(headers)
      client = client.auth("Bearer #{@auth_token}") unless @auth_token.nil?
      response = client.delete(@base_url, ssl_context: ssl_ctx, params: params)
    end

    private

    def http_client
      HTTP.follow(max_hops: 3)
    end

    def ssl_ctx
      ctx = OpenSSL::SSL::SSLContext.new
      ctx.verify_mode = OpenSSL::SSL::VERIFY_NONE

      ctx
    end
  end
end
