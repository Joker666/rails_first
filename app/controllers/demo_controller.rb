class DemoController < ApplicationController

  layout 'application'

  def index
    @array = [1,2,3,4,5]
  end

  def hello
    #render('hello')
    @id = params['id']
    @page = params[:page].to_i
  end

  def other_hello
    redirect_to(:controller => 'demo', :action => 'index')
  end

  def itechoid
    redirect_to('http://itechoid.com')
  end

  def text_helpers
  end

  def escape_output
  end

end
