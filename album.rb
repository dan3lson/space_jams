class Album
  attr_reader :id, :title, :artists, :tracks

  def initialize(id, title, artists)
    @id = id
    @title = title
    @artists = artists
    @tracks = []
  end

  def track_names
    all_tracks = ""
    tracks.each do |track|
      all_tracks << "\n- " << track.title
    end
    all_tracks
  end

  def milli_to_sec_conversion(millisseconds)
    millisseconds / 60_000
  end

  def track_duration
    track_min = 0.00
    @tracks.each do |hash|
      track_min = milli_to_sec_conversion(hash.duration_ms.to_f)
    end
    track_min.round(2)
  end

  def summary
    %{
Name: #{title}
Artist(s): #{artists}
Duration: #{track_duration} minutes
Tracks: #{track_names}
    }
  end
end
