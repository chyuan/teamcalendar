class FreeTimesController < ApplicationController
  def index
    @hours = Hour.find_all_by_numberbusy(0)
    @sunday = Hour.find_all_by_time('2012-04-08 08:00:00'..'2012-04-08 23:00:00')
    @monday = Hour.find_all_by_time('2012-04-09 08:00:00'..'2012-04-09 23:00:00')
    @tuesday = Hour.find_all_by_time('2012-04-10 08:00:00'..'2012-04-10 23:00:00')
    @wednesday = Hour.find_all_by_time('2012-04-11 08:00:00'..'2012-04-11 23:00:00')
    @thursday = Hour.find_all_by_time('2012-04-12 08:00:00'..'2012-04-12 23:00:00')
    @friday = Hour.find_all_by_time('2012-04-13 08:00:00'..'2012-04-13 23:00:00')
    @saturday = Hour.find_all_by_time('2012-04-14 08:00:00'..'2012-04-14 23:00:00')
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hours }
    end
  end
end

