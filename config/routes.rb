DataUriToImgUrl::Application.routes.draw do
  resources :images, :only => [:show, :create]
end

#== Route Map
# Generated on 10 Nov 2013 14:19
#
# images POST /images(.:format)     images#create
#  image GET  /images/:id(.:format) images#show
