class FreeTimesController < ApplicationController
  def index
    @hours = Hour.find_all_by_numberbusy(0)
    @sunday = Hour.all(:conditions => ["(numberbusy = '0') AND time >= '2012-04-08 08:00:00' AND time <= '2012-04-08 23:00:00'"])
    @monday = Hour.all(:conditions => ["(numberbusy = '0') AND time >= '2012-04-09 08:00:00' AND time <= '2012-04-09 23:00:00'"])
    @tuesday = Hour.all(:conditions => ["(numberbusy = '0') AND time >= '2012-04-10 08:00:00' AND time <= '2012-04-10 23:00:00'"])
    @wednesday = Hour.all(:conditions => ["(numberbusy = '0') AND time >= '2012-04-11 08:00:00' AND time <= '2012-04-11 23:00:00'"])
    @thursday = Hour.all(:conditions => ["(numberbusy = '0') AND time >= '2012-04-12 08:00:00' AND time <= '2012-04-12 23:00:00'"])
    @friday = Hour.all(:conditions => ["(numberbusy = '0') AND time >= '2012-04-13 08:00:00' AND time <= '2012-04-13 23:00:00'"])
    @saturday = Hour.all(:conditions => ["(numberbusy = '0') AND time >= '2012-04-14 08:00:00' AND time <= '2012-04-14 23:00:00'"])
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hours }
    end
  end
end



#Hour.all(:conditions => ["(numberbusy = '1') AND time >= '2012-04-13 08:00:00' AND time <= '2012-04-13 23:00:00'"])
