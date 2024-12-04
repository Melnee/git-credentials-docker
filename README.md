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
