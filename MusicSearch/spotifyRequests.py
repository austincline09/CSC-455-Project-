import requests

def search_artist(artist_name):
    search_url = "https://api.spotify.com/v1/search?q="+artist_name+"&type=artist"
    artists = requests.get(search_url)
    for artist in artists.json()['artists']['items']:
        if artist['name'] == artist_name:
            return {'name': artist['name'], 'id': artist['id']}

def get_albums(artist_id):
    search_url = "https://api.spotify.com/v1/artists/"+artist_id+"/albums"
    albums = requests.get(search_url)
    for album in albums.json()['items']:
        print {'name': album['name']}