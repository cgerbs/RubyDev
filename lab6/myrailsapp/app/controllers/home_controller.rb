# note: this was implemented when I was adding the rails routes/pages manually

class HomeController < ApplicationController # rails will get view: page1.html.erb
  def page1; end
  def page2; end # rails will get view: page2.html.erb
end
