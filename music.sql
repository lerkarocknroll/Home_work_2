CREATE TABLE Genres (
    genre_id SERIAL PRIMARY KEY,
    genre_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Artists (
    artist_id SERIAL PRIMARY KEY,
    artist_name VARCHAR(255) NOT NULL
);

CREATE TABLE Albums (
    album_id SERIAL PRIMARY KEY,
    album_name VARCHAR(255) NOT NULL,
    release_year INTEGER NOT NULL
);

CREATE TABLE Tracks (
    track_id SERIAL PRIMARY KEY,
    track_name VARCHAR(255) NOT NULL,
    duration INTEGER,
    album_id INTEGER NOT NULL,
    FOREIGN KEY (album_id) REFERENCES Albums(album_id) ON DELETE CASCADE
);

CREATE TABLE Collections (
    collection_id SERIAL PRIMARY KEY,
    collection_name VARCHAR(255) NOT NULL,
    collection_year INTEGER NOT NULL
);

CREATE TABLE GenreArtist (
    genre_id INTEGER NOT NULL,
    artist_id INTEGER NOT NULL,
    PRIMARY KEY (genre_id, artist_id),
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id) ON DELETE CASCADE,
    FOREIGN KEY (artist_id) REFERENCES Artists(artist_id) ON DELETE CASCADE
);

CREATE TABLE ArtistAlbum (
    artist_id INTEGER NOT NULL,
    album_id INTEGER NOT NULL,
    PRIMARY KEY (artist_id, album_id),
    FOREIGN KEY (artist_id) REFERENCES Artists(artist_id) ON DELETE CASCADE,
    FOREIGN KEY (album_id) REFERENCES Albums(album_id) ON DELETE CASCADE
);
CREATE TABLE Genres (
    genre_id SERIAL PRIMARY KEY,
    genre_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE INDEX idx_tracks_album_id ON Tracks(album_id);
CREATE INDEX idx_tracks_name ON Tracks(track_name);
CREATE INDEX idx_genre_artist_genre_id ON GenreArtist(genre_id);
CREATE INDEX idx_genre_artist_artist_id ON GenreArtist(artist_id);
CREATE INDEX idx_artist_album_artist_id ON ArtistAlbum(artist_id);
CREATE INDEX idx_artist_album_album_id ON ArtistAlbum(album_id);
CREATE INDEX idx_artists_name ON Artists(artist_name);
CREATE INDEX idx_albums_name ON Albums(album_name);
CREATE INDEX idx_albums_year ON Albums(release_year);
CREATE INDEX idx_collections_name ON Collections(collection_name);
CREATE INDEX idx_collections_year ON Collections(collection_year);