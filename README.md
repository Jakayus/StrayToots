# StrayToots

This Project creates a Mastodon Client for the Apple Watch that allows for simple Toot activities ("Favourite", "Boost", "Bookmark".) 

The Watch and iPhone Apps must both be downloaded for Toots to be seen. Simple Toot interaction occurs on the Watch App. while settings and signing in happens on the companion iPhone app.

## App objectives:

iPhone app:
- Log into an instance using iPhone companion app

Watch App:
- View user's home timeline
- "Favourite" a Toot
- "Boost" a Toot
- "Bookmark" a Toot

## Setup

### Running the Project
The project currently uses a plist file that is used to place the access token needed for API calls. Use the [Mastodon API](https://docs.joinmastodon.org/api/ "Mastodon API") to get the access token.

The following steps are needed to successfully run the app:

    1. Clone, Fork, or Download the project for personal use
    2. Create a copy of the "TokensExample.plist" file and rename it to "Tokens.plist"
    3. Add your personal Access Token to the file
    4. Compile and Run project

### Mastodon Access Token

I personally used [Postman](https://www.postman.com "Postman.com")for getting the tokens, but any API tool will do. Before getting an access token, you must first get a client ID and a client access key from Mastodon. 

Steps:
- Request a [ClientID and ClientSecret](https://docs.joinmastodon.org/client/token/#app)
- Use the [Authorization GET Request](https://docs.joinmastodon.org/client/authorized/#login) within a web browser using the Client information provided earlier
- Sign into your instance and authorize the client 
- Receive an access token for use in the app


# Personal Note

This README, and it's project, is a continual work in progress. Although there are good Swift Package Managers that can make some of these tasks much easier, I wanted to initially make sure I understand basic networking concepts and can read and understand API documentation. I also want to start Toot-ing as much as I Tweet.

This Project is covered by the MIT License.
