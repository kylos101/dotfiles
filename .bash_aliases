#!/bin/bash

if [ test -d ~/dotfiles ]
then
    FOLDER=~/dotfiles
else
    FOLDER=~/
fi

source $FOLDER/gcloud/.alias
source $FOLDER/gcloud/.functions

source $FOLDER/git/.alias
source $FOLDER/git/.functions
source $FOLDER/git/.run

source $FOLDER/gitpod/.alias
source $FOLDER/gitpod/.functions

source $FOLDER/system/.alias

source $FOLDER/kubernetes/.env
source $FOLDER/kubernetes/.alias
source $FOLDER/kubernetes/.functions

source $FOLDER/dev/.functions
source $FOLDER/system/.functions

source $FOLDER/nerdctl/.functions
source $FOLDER/docker/.functions

source $FOLDER/golang/.alias

source $FOLDER/aws/.alias
source $FOLDER/aws/.functions