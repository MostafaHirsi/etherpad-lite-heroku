# ETHERPAD LITE DOCKER 

This is a wrapper of etherpad-lite for Docker.

## quickstart

* Clone this repo into a directory of your choice
* open terminal and cd into the root directory
* Run the following in your terminal.
```bash
sh buildandrun.sh
```

* You should now be able to access etherpad at localhost:9001

 The buildandrun.sh script builds and runs the dockerfile in one command. 
 On the first run it may be quite slow, as it needs to pull in all the dependencies, 
 on following runs it will be much faster however.

## NOTE:

When changes are made to the code, you must run the script again to incorporate these changes.

## TODO
* How to make the npm modules install only once, instead of each time the dockerfile is run? (maybe shared volume)
* How to structure the project so that it is easier to merge changes from original etherpad repo?