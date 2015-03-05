describe 'Genre' do
  before(:each) do
    @genre = Genre.create(name: "Hip Hop")
  end

  it 'has a name' do
    expect(Genre.where(name: "Hip Hop").first).to eq(@genre)
  end

  it 'has many songs' do
    @genre.songs << Song.create(name: "7/11")
    @genre.save

    found_song = Song.find_by(name: "7/11")
    expect(found_song.genre).to eq(@genre)
  end

  it 'is also associated with an artist' do
    artist = Artist.create(name: "Ne-Yo")
    song = Song.create(name: "She Knows", genre: @genre)
    artist.songs << song
    artist.save 

    expect(@genre.artists).to include(artist)
  end
end