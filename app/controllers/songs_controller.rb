class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]


  # GET /songs
  # GET /songs.json
  def index
    @songs = Song.all
    @playlist = Playlist.find(params[:playlist_id])
    @song = @playlist[:id]
end
  # GET /songs/1
  # GET /songs/1.json
  def show
    @playlist = Playlist.find(params[:playlist_id])
  end

  # GET /songs/new
  def new
  end

  # GET /songs/1/edit
  def edit
    @playlist = Playlist.find(params[:playlist_id])
  end

  # POST /songs
  # POST /songs.json
  def create
    @song = Song.new(song_params)
    @song.playlist_id = params[:playlist_id]

    respond_to do |format|
      if @song.save
        format.html { redirect_to playlist_song_path(@song.playlist_id, @song.id), notice: 'Song was successfully created.' }
        format.json { render :show, status: :created, location: @song }
      else
        format.html { render :new }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /songs/1
  # PATCH/PUT /songs/1.json
  def update
    respond_to do |format|
      if @song.update(song_params)
        format.html { redirect_to playlist_song_path(@song.playlist_id, @song.id), notice: 'Song was successfully updated.' }
        format.json { render :show, status: :ok, location: @song }
      else
        format.html { render :edit }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    @song.destroy
    respond_to do |format|
      format.html { redirect_to playlist_path(Playlist.find(params[:playlist_id])), notice: 'Song was successfully destroyed.'  }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_params
      params.require(:song).permit(:name, :artist, :playlist_id)
    end
end
