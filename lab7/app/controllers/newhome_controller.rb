class NewhomeController < ApplicationController
  def page1
    @time = Time.now
  end

  def page2
    @time2 = Time.now
  end
end
