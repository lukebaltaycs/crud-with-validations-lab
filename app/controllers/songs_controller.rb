class SongsController < ApplicationController

def show
    set_song
end

def index
    @songs = Song.all
end

def edit
    set_song
end

def update
    set_song
    @song.assign_attributes(song_params)
    if @song.valid?
        @song.save
        flash[:notice] = "Song succesfully updated"
        redirect_to song_path(@song)
    else
        render :edit
    end
end

def new
    @song = Song.new
end

def create
    @song = Song.new(song_params)
    if @song.valid?
        @song.save
        flash[:notice] = "Song succesfully created."
        redirect_to song_path(@song)
    else
        render :new
    end
end

def destroy
    set_song
    @song.destroy
    redirect_to songs_path
end

private

def set_song
    @song = Song.find(params[:id])
end

def song_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
end

end
