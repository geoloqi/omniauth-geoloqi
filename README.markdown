omniauth-geoloqi
===
Adapter for the [Omniauth](https://github.com/intridea/omniauth) gem. Requires version 1.0 or later.

Installation
---

    gem install omniauth-geoloqi

Basic Usage (with Sinatra)
---

    use Rack::Session::Cookie
    use OmniAuth::Builder do
      provider :geoloqi, 'YOUR CLIENT ID', 'YOUR CLIENT SECRET'
    end

    # Direct user to '/auth/geoloqi' to start authorization.
    
    get '/auth/geoloqi/callback' do
      puts "THE RESULT HASH: #{request.env['omniauth.auth']}"
    end

Found a bug?
---
Let us know! Send a pull request or a patch. Questions? Ask! We're here to help. File issues, we'll respond to them!

Authors
---
* Kyle Drake

TODO / Possible projects
---
* Integrate with Geoloqi ruby client
* Better examples