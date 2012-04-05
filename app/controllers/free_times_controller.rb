class FreeTimesController < ApplicationController
  def index
    @hours = Hour.find_all_by_numberbusy(0)
    @order = Hour.find(:all, :order => 'id')
    @sunday = Hour.find(:all, :order => 'id', :conditions => ["numberbusy = '0' AND id >= '9' AND id <= '24'"])
    @monday = Hour.find(:all, :order => 'id', :conditions => ["numberbusy = '0' AND id >= '33' AND id <= '48'"])
    @tuesday = Hour.find(:all, :order => 'id', :conditions => ["numberbusy = '0' AND id >= '57' AND id <= '72'"])
    @wednesday = Hour.find(:all, :order => 'id',:conditions => ["numberbusy = '0' AND id >= '81' AND id <= '96'"])
    @thursday = Hour.find(:all, :order => 'id', :conditions => ["numberbusy = '0' AND id >= '105' AND id <= '120'"])
    @friday = Hour.find(:all, :order => 'id', :conditions => ["numberbusy = '0' AND id >= '129' AND id <= '144'"])
    @saturday = Hour.find(:all, :order => 'id',:conditions => ["numberbusy = '0' AND id >= '153' AND id <= '168'"])
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hours }
    end
  end
end


