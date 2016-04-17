class EntriesController < ApplicationController
before_action :authenticate_admin!

def index
	@entries = Entry.order("created_at desc").all
end

def new
	@entry = Entry.new
end

def create
	@entry = Entry.new(entry_params)
	respond_to do |format|
		if @entry.save
			format.html { redirect_to root_path, notice: 'Entry was successfully added.' }
    		# format.json { render :show, status: :created, location: @device }
		else
    		format.html { render :new }
   		    # format.json { render json: @device.errors, status: :unprocessable_entity }
  		end
  	end
end

def destroy
	@entry = Entry.find(params[:id])
	@entry.destroy
	respond_to do |format|
      format.html { redirect_to root_path, notice: 'Entry was successfully removed.' }
	  format.json { head :no_content }
 	end
end

def entry_params
  params.require(:entry).permit(:name, :number)
end
end
