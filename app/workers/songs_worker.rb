class SongsWorker
  require 'csv'
  include Sidekiq::Worker

  def perform(songs_file)
    CSV.foreach(songs_file, headers: true) do |song|
      artist = Artist.find_or_create_by(name: song[1])
      artist.songs.find_or_create_by(title: song[0])
    end
  end
end
