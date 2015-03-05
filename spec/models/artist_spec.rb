describe 'Artist' do
  before(:each) do
    @prince = Artist.create(name: "Prince")
  end
  
  it 'has a name' do
    expect(Artist.find_by(name: "Prince")).to eq(@prince)
  end

  it 'can build a song' do
    song = @prince.songs.build(name: "Raspberry Beret")
    song.save

    expect(@prince.songs).to include(song)
  end

  it 'can create a song' do
    song = @prince.songs.create(name: "Little Red Corvette")

    expect(@prince.songs).to include(song)
  end

  it 'knows about songs that are affiliated with it' do
    song = Song.create(name: "Purple Rain", artist: @prince)

    expect(@prince.songs).to include(song)
  end

  it 'can add many songs at the same time' do
    song_1 = Song.create(:name => "Raspberry Beret")    
    song_2 = Song.create(:name => "When Doves Cry")    
    @prince.songs << [song_1, song_2]

    expect(Artist.find_by(name: "Prince").songs.count).to eq(2)
  end

  it 'knows about its genres' do
    song = Song.create(name: "I Wanna Be Your Lover")
    genre = Genre.create(name: "Post-Disco")
    song.genre = genre
    song.save
    @prince.songs << song

    expect(@prince.genres).to include(genre)
  end
end