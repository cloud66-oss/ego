Rails.application.routes.draw do
	get 'generate/:letters', :to => 'images#generate'
	get 'generate/:letters/size/:size', :to => 'images#generate'
end
