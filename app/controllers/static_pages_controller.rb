class StaticPagesController < ApplicationController

    def home
       #flickr = FlickRaw::Flickr.new
        @photo_urls = []
        if params[:search]
            user_id = search_params[:user_id] 
            photos_info = flickr.people.getPublicPhotos(user_id: user_id)
            photos_info.each do |photo_info|
                @photo_urls << FlickRaw.url(photo_info)
            end
        end
       
    end

    private

        def search_params
            params.require(:search).permit(:user_id)
        end
end
