# Phone Fishing

Imagine you've been working for 10 days straight and each of those days were 10 hour shifts.  You've barely had time to look at the water, never mind knowing where the fish are going to be.  Do you want to spend your entire day off burning fuel from spot to spot or do you want a little bit of a tip?  Sure time is money, but so is fuel - so don't waste the time, or the fuel and just catch fish.  With Phone Fishing, just pick up your phone, sign in, and see what kind of fishing reports are recent in your area.  Do yourself a favor - spend your free time wisely. (with phone fishing).

## Check my App out on Heroku

* [Phone Fishing](https://phone-fishing.herokuapp.com/)


### Running locally
To run the application, please just clone the repo and run it like so:

```
git clone https://github.com/alexjka/phone-fishing.git
cd phone-fishing
bundle install
npm install
then run in the console
$npm start
$rails s

```

#### Current features
* Signup and Sign in
* Show User profile where you can edit or delete profile
* Add and List fishing spots
* Add and List fishing reports
* Recieve SMS text when new reports are added to a fishing spot you "liked"

### TODOs
* Intergreat Google Maps API for mapping and geocoding fishing spots


## Built With

* Ruby version 2.3.3
* [Devise](https://github.com/plataformatec/devise) - Used to authenticate users
* [React.js](https://facebook.github.io/react/) - Used to build a beautiful user
interface
* [Foundation-Rails](https://github.com/zurb/foundation-rails) - Used to add
Foundation to our Rails project
* [Twilio-ruby](https://github.com/twilio/twilio-ruby) - Used for sending sms
text messages


## License

This project is open source.
If you think you can improve on it, please do.

## Contributing

Please read
[CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426)
for details on our code of conduct, and the process for submitting pull
requests to us.


## Author

* **Alexander J. Kalife**

## License

This project is open for you to try to make it better!

## Acknowledgments

* All the friendly folks at Launch Academy that helped me along the way

![Build Status](https://codeship.com/projects/3981ad90-0f13-0135-185a-5e5ebf8267fc/status?branch=master)
![Code Climate](https://codeclimate.com/github/alexjka/phone-fishing.png)
[![Coverage Status](https://coveralls.io/repos/github/alexjka/phone-fishing/badge.svg?branch=master)](https://coveralls.io/github/alexjka/phone-fishing?branch=master)
