class InquiriesController < ApplicationController
    def index
       @inquiry = Inquiry.new 
    end
    def confirm
        @inquiry = Inquiry.new(inquiry_params)
        @inquiry.valid?
        render :action => "confirm"
    end
def thanks
        @inquiry = Inquiry.new(inquiry_params)
        if params[:back]
            render :action => "index"
        elsif @inquiry.save
            render :action => "thanks"
        else
            render :action => "thanks"
        end
end
    
    private
    def inquiry_params
    params.require(:inquiry).permit(:name, :email, :content)
    end
    
end
