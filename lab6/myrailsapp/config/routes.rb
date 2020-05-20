Rails.application.routes.draw do
  get 'newhome/page1'
  get 'newhome/page2'
  get '/singlepage', to: 'single#singlepage'
  get '/', to: 'root#homepage'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # these were manually added
  get '/home/page1' # home#page1... '/home/' was created in part_6.1
  get '/home/page2' # home#page2
end
