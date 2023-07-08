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

A Mastodon Access Token is required before running the project. This token is placed into a plist file in order to run.

### Mastodon Access Token

I personally used [Postman](https://www.postman.com "Postman.com") for getting the tokens, but any API inspector tool will do. Before getting an access token, you must first get a client ID and a client access key from Mastodon. Steps are listed below, with additional notes on doing it through Postman.

Request a [ClientID and ClientSecret](https://docs.joinmastodon.org/client/token/#app)
- Copy and paste the curl command from the above link into your desired API inspection tool (in Postman: After creating a workspace, click "Import" on the top left near the workspace name, and copy/paste the curl command into the text field that comes up. Postman will create a POST command for you.)
- Replace "mastodon.example" with your desired mastodon instance
- Send your POST command using the API inspector tool used
- Save off the contents somewhere for future use. Most important will be the **client_id** and the **client_secret**


Use the [Authorization GET Request](https://docs.joinmastodon.org/client/authorized/#login) within a web browser using the Client information provided earlier
- Click the link above and copy/paste the https command somewhere you can edit it
- replace "mastodon.exmaple" with your mastodon instance and "CLIENT_ID" with your client id
- remove the line endings so that the command is one long string
- copy/paste this string into your browser
- it will bring you to your instance login page. Log into your account
- will ask you to grant access based upon the request made
- copy the authorization code and store it somewhere safe

Congrats! You finished the API setup! Now time to get back to Xcode.

### Running the Project
The above steps provide a method to getting an access code. Please also refer to the [Mastodon API](https://docs.joinmastodon.org/api/ "Mastodon API") documentation if more information is needed. 

The project currently uses a plist file that is used to place the access token needed for API calls. You will be creating a new plist file with the access code just generated. This should allow you to access your instance.

The following steps are needed to successfully run the app:

    1. Clone, Fork, or Download the project for personal use
    2. Create a copy of the "TokensExample.plist" file and rename it to "Tokens.plist" (spelling is important so that you don't accidentally commit your token to the repo)
    3. Copy/Paste your personal Access Token to the file
    4. Compile and Run "Stray Toots" for the companion iPhone app
    5. Compile and Run "Stray Toots Watch App" for the Watch App (which will have the Toots)



# Personal Note

This README, and it's project, is a continual work in progress. Although there are good Swift Package Managers that can make some of these tasks much easier, I wanted to initially make sure I understand basic networking concepts and can read and understand API documentation. I also want to start Toot-ing as much as I Tweet.

This Project is covered by the MIT License.
