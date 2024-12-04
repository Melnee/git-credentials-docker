Create a .env file in the root directory that looks like this:
GIT_USERNAME=
GIT_FULL_NAME=
GIT_EMAIL=
GIT_PASSWORD=
SSH_PRIVATE_KEY=

The private rsa key is the one found via cat ~/.ssh/id_rsa
That's the one you place in this .env file

the public one is the one you place in the ssh/gpg keys section of your github. That one is found via:

cat ~/.ssh/id_rsa.pub


## Launch:
`sudo docker compose build`
`sudo docker compose up`

Then within another terminal, run:
`bash enter-container-bash.sh`

And then your host filesystem can be found within the `/host` folder

You can then navigate into that to get into your Documents etc

Then pull git repositories from within docker at will
