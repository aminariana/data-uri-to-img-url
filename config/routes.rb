DataUriToImgUrl::Application.routes.draw do
  root :to => 'images#new'

  resources :images, :only => [:show, :new, :create]
end

#== Route Map
# Generated on 10 Nov 2013 14:30
#
#      root GET  /                     images#new
#    images POST /images(.:format)     images#create
# new_image GET  /images/new(.:format) images#new
#     image GET  /images/:id(.:format) images#show
