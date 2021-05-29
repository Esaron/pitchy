# Pitchy

A simple app for users to create projects with slide decks and like other users' projects.

I'd never write an application in this way for a production environment, but I wanted to both spin something up quickly, and showcase various skills. That's only about 75% an excuse for not wanting to work on this for more than like 12 hours.

The application uses Rails with a hybrid erb/React front end. If I were trying to create a real app, I'd probably go the SPA route, especially if I was able to start from scratch like this, but I also wanted to demonstrate how one might go about bolting React onto an existing Rails app. I also would probably use the newer style of React with hooks, but I'm a bit more comfortable in the old class syntax and wanted to get this done fast. The UI is garbage, but it wouldn't be too difficult to polish it (maybe a bit time-consuming). I wanted to make sure it was easy to run in a dev environment since that's where it'll likely be demo'd, but I also wanted to set it up for easy integration with a CDN later. Right now it just serves the pitch decks statically.

Supported file types are whitelisted to be common image formats, pdf, docx, and pptx, but I'm pretty sure the libraries used could intake just about anything.

I hate these kinds of projects because I always end up moving too fast and leaving myself with a pile of tech debt, but this should serve to demonstrate a varied skillset. Normally, I'd have more fun with it and add some personality to the app. I didn't this time. Just pretend it's funny ;)

# Usage

#### Prerequisites

- Docker (https://docs.docker.com/engine/install, or use your package manager of choice)
- Git (https://git-scm.com/downloads, or use your package manager of choice)

#### Running

```sh
git clone https://github.com/esaron/pitchy
cd pitchy
sudo docker compose up -d # You don't always need sudo, but for Ubuntu you might
# Open localhost:3000 in your browser
# Sign up with a new email:password or log in with the pre-seeded one (a@a:admina)
# Click on Profile in the top right
# Create a new project or go to the preseeded one to upload/view a pitch deck
```
