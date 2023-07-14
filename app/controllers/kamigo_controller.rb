require('net/http')

class KamigoController < ApplicationController
    def eat
        render plain: '大麥克買十送十！'
    end

    def request_header
        render plain: request.headers.to_h.reject{ |key, value|
            key.include? '.'
        }.map{ |key, value|
            "#{key}: #{value}"
        }.sort.join("\n")
    end

    def request_body
        render plain: request.body
    end

    def response_header
        render plain: response.headers.to_h.map{ |key, value|
            "#{key}: #{value}"
        }.sort.join("\n")
    end

    def show_response_body
        puts "我在這裡來打我啊dOuOb"
        render plain: "哈哈哈"
    end

    def send_request
        uri = URI('http://localhost:3000/kamigo/eat')
        http = Net::HTTP.new(uri.host, uri.port)
        http_request = Net::HTTP::Get.new(uri)
        http_response = http.request(http_request)

        render plain: JSON.pretty_generate({
            request_class: request.class,
            response_class: response.class,
            http_request_class: http_request.class,
            http_response_class: http_response.class
        })
    end
    
    def translate_to_korean(message)
        "#{message}油油~"
    end

end