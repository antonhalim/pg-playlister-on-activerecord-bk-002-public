describe 'Song' do
  before(:each) do
    @song = Song.create(name: "Smells Like Teen Spirit")
  end
  
  it 'has a name' do
    expect(Song.where(name: "Smells Like Teen Spirit").first).to eq(@song)
  end

  it 'has a genre' do
    genre = Genre.create(name: "Rock")
    @song.genre = genre
    @song.save

    expect(Song.find_by(name: "Smells Like Teen Spirit").genre).to eq(genre)
  end

  it 'can have an artist' do
    artist = Artist.create(name: "Nirvana")
    @song.artist = artist
    @song.save

    expect(Song.where(name: "Smells Like Teen Spirit").first.artist).to eq(artist)
  end

  it 'can be created with an artist as an attribute' do
    artist = Artist.create(name: "The Beatles")
    song = Song.create(name: "Yellow Submarine", artist: artist)

    expect(Song.where(name: "Yellow Submarine").first.artist).to eq(artist)
  end

  it 'can build genres' do
    coco_song = Song.create(name: "Coco")
    genre = coco_song.build_genre(name: "Rap")
    coco_song.save
    
    expect(Song.where(name: "Coco").first.genre).to eq(genre)
    expect(Genre.where(name: "Rap").first.songs).to include(coco_song)
  end
end