class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  def index
    @events = Event.all
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
    @users = User.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new
    @users = User.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
    @users = User.all
    
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])
    @users = User.all
    respond_to do |format|
      if @event.save
	if (@event.starttime.year == 2012 and @event.starttime.month == 4 and @event.starttime.day >= 8)
	  logger.debug "Event in range: #{@event.id}"
	  for day in @event.starttime.day..@event.endtime.day
            if (@event.starttime.day == @event.endtime.day) 
              for hour in @event.starttime.hour..(@event.endtime.hour)
	        logger.debug "Event in range: #{day}"
	        logger.debug "Event in range: #{hour}"
                @hour = Hour.find_by_time(Time.utc(2012, 4, day, hour, 00, 00).in_time_zone)
	        logger.debug "hour id: #{@hour.id}"
	        @hour.numberbusy += 1
	        @hour.save
		logger.debug "event's new numberbusy: #{@hour.numberbusy}"
	      end
	    elsif (day == @event.starttime.day)
              for hour in @event.starttime.hour..23
	        logger.debug "Event in range: #{day}"
	        logger.debug "Event in range: #{hour}"
                @hour = Hour.find_by_time(Time.utc(2012, 4, day, hour, 00, 00).in_time_zone)
	        logger.debug "hour id: #{@hour.id}"
	        @hour.numberbusy += 1
	        @hour.save
		logger.debug "event's new numberbusy: #{@hour.numberbusy}"
	      end
	    elsif (day == @event.endtime.day)
              for hour in 0..(@event.endtime.hour + 1)
		logger.debug "Event in range: #{day}"
	        logger.debug "Event in range: #{hour}"
                @hour = Hour.find_by_time(Time.utc(2012, 4, day, hour, 00, 00).in_time_zone)
	        logger.debug "hour id: #{@hour.id}"
	        @hour.numberbusy += 1
	        @hour.save
		logger.debug "event's new numberbusy: #{@hour.numberbusy}"
	      end
	    else
              for hour in 0..23
		logger.debug "Event in range: #{day}"
	        logger.debug "Event in range: #{hour}"
                @hour = Hour.find_by_time(Time.utc(2012, 4, day, hour, 00, 00).in_time_zone)
	        logger.debug "hour id: #{@hour.id}"
	        @hour.numberbusy += 1
	        @hour.save
		logger.debug "event's new numberbusy: #{@hour.numberbusy}"
	      end
	    end
	  end
	end
	format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])
    @users = User.all

    respond_to do |format|
      if @event.update_attributes(params[:event])
        
  
       @event.save
        
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @users = User.all
 #   @event.destroy

    respond_to do |format|
      
         if @event.destroy
    	if (@event.starttime.year == 2012 and @event.starttime.month == 4 and @event.starttime.day >= 8)
    	  logger.debug "Event in range: #{@event.id}"
    	  for day in @event.starttime.day..@event.endtime.day
                if (@event.starttime.day == @event.endtime.day) 
                  for hour in @event.starttime.hour..(@event.endtime.hour)
    	        logger.debug "Event in range: #{day}"
    	        logger.debug "Event in range: #{hour}"
                    @hour = Hour.find_by_time(Time.utc(2012, 4, day, hour, 00, 00).in_time_zone)
    	        logger.debug "hour id: #{@hour.id}"
    	        @hour.numberbusy -= 1
    	        @hour.save
    		logger.debug "event's new numberbusy: #{@hour.numberbusy}"
    	      end
    	    elsif (day == @event.starttime.day)
                  for hour in @event.starttime.hour..23
    	        logger.debug "Event in range: #{day}"
    	        logger.debug "Event in range: #{hour}"
                    @hour = Hour.find_by_time(Time.utc(2012, 4, day, hour, 00, 00).in_time_zone)
    	        logger.debug "hour id: #{@hour.id}"
    	        @hour.numberbusy -= 1
    	        @hour.save
    		logger.debug "event's new numberbusy: #{@hour.numberbusy}"
    	      end
    	    elsif (day == @event.endtime.day)
                  for hour in 0..(@event.endtime.hour + 1)
    		logger.debug "Event in range: #{day}"
    	        logger.debug "Event in range: #{hour}"
                    @hour = Hour.find_by_time(Time.utc(2012, 4, day, hour, 00, 00).in_time_zone)
    	        logger.debug "hour id: #{@hour.id}"
    	        @hour.numberbusy -= 1
    	        @hour.save
    		logger.debug "event's new numberbusy: #{@hour.numberbusy}"
    	      end
    	    else
                  for hour in 0..23
    		logger.debug "Event in range: #{day}"
    	        logger.debug "Event in range: #{hour}"
                    @hour = Hour.find_by_time(Time.utc(2012, 4, day, hour, 00, 00).in_time_zone)
    	        logger.debug "hour id: #{@hour.id}"
    	        @hour.numberbusy -= 1
    	        @hour.save
    		logger.debug "event's new numberbusy: #{@hour.numberbusy}"
    	      end
    	    end
    	  end
end
      
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end
end

end
