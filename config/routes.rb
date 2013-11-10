DataUriToImgUrl::Application.routes.draw do
  resources :images, :only => [:show, :new, :create]
end

#== Route Map
# Generated on 10 Nov 2013 14:27
#
#    images POST /images(.:format)     images#create
# new_image GET  /images/new(.:format) images#new
#     image GET  /images/:id(.:format) images#show
