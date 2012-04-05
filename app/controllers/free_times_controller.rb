class FreeTimesController < ApplicationController
  def index
    @hours = Hour.find_all_by_numberbusy(0)
    @sunday = Hour.all(:conditions => ["numberbusy = '0' AND id >= '9' AND id <= '24'"])
    @monday = Hour.all(:conditions => ["numberbusy = '0' AND id >= '33' AND id <= '48'"])
    @tuesday = Hour.all(:conditions => ["numberbusy = '0' AND id >= '57' AND id <= '72'"])
    @wednesday = Hour.all(:conditions => ["numberbusy = '0' AND id >= '81' AND id <= '96'"])
    @thursday = Hour.all(:conditions => ["numberbusy = '0' AND id >= '105' AND id <= '120'"])
    @friday = Hour.all(:conditions => ["numberbusy = '0' AND id >= '129' AND id <= '144'"])
    @saturday = Hour.all(:conditions => ["numberbusy = '0' AND id >= '153' AND id <= '168'"])
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hours }
    end
  end
end


