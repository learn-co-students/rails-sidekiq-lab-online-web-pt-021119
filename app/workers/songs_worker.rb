class SongsWorker
  require 'csv'
  include Sidekiq::Worker

  def perform(artists_file)
    CSV.foreach(artists_file, headers: true) do |artists|
      Artist.create(name: artists[1])
      Song.create(title: artists[0])
    end
  end
end
