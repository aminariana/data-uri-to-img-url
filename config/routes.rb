DataUriToImgUrl::Application.routes.draw do
  root :to => 'images#new'

  get "/:id" => 'images#decode', :as => "render_image"

  resources :images, :only => [:show, :new, :create]
end

#== Route Map
# Generated on 10 Nov 2013 16:28
#
#         root GET  /                     images#new
# render_image GET  /:id(.:format)        images#decode
#       images POST /images(.:format)     images#create
#    new_image GET  /images/new(.:format) images#new
#        image GET  /images/:id(.:format) images#show
