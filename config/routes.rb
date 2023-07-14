Rails.application.routes.draw do
	get 'kamigo/eat', to: 'kamigo#eat'
	get 'kamigo/request_header', to: 'kamigo#request_header'
	get 'kamigo/request_body', to: 'kamigo#request_body'
	get 'kamigo/response_header', to: 'kamigo#response_header'
	get 'kamigo/response_body', to: 'kamigo#show_response_body'
	get 'kamigo/send_request', to: 'kamigo#send_request'
end
