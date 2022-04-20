class MapsController < ApplicationController

    def location
        @route_title = params[:route_title]
        @location_string = params[:where]

        if params[:where] == "Back Wall"
            @location = "back_wall.png"
        elsif params[:where] == "The Cave"
            @location = "the_cave.png"
        elsif params[:where] == "Back Right"
            @location = "back_right.png"
        elsif params[:where] == "Middle Front"
            @location = "middle_front.png"
        elsif params[:where] == "Middle Left"
            @location = "middle_left.png"
        elsif params[:where] == "Middle Back"
            @location = "middle_back.png"
        elsif params[:where] == "Middle Right"
            @location = "middle_right.png"
        elsif params[:where] == "Comp Wall"
            @location = "comp_wall.png"
        else
            @location = "middle_front.png"
        end

        render :location
    end

end
