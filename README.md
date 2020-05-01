# Phase4 Development Environment

This repository forms a self contained development environment for the Phase4 project. Find out more information about the Phase4 amateur radio satellite project here: [Phase4Space.github.io](https://phase4space.github.io/).

## Purpose

The Phase4 project uses a number of complicated software which can be a pain to install. This enviroment should allow easy access to the projects technical development by easily installing a Docker image.

**NOTE - This is still in early development and probably needs a lot things added or bugs fixed.  Please file issues or pull requests to improve the experience for everyone.**

## Installation

Perform the following actions to install the development environment:

1. Fetch the repository:

  ```git clone https://github.com/phase4space/development-environment.git```

2. Enter the repository:

  ```cd development-environment```

3. Build the Docker image - you will be asked for your password to install Docker (the build process should take a looong time):

  ```./build.sh```
    
Congratulations, you should now be ready to use all of Phase4's code.  A system enviroment, ``PHASE4_DEV_DIR``, should have been installed that defines where the other repositories can find the development environment.

## Usage

The other repositories which use the environment should handle the access to the development environment using the defined system environment.  However, here are some pointers:

### GNURadio

You can start a GNURadio instance by running:

  ```$PHASE4_DEV_DIR/gnuradio```
    
This should launch the GNURadio Companion GUI. Your home folder should be available from the GNURadio GUI.

### Jupyter Notebook

You can start a Jupyter Notebook environment by running:

  ```$PHASE4_DEV_DIR/jupyter DIR```
    
Where ``DIR`` is the directory you want to access or store the Jupyter Notebooks.

The browser interface can then be accessed by using the link shown in the terminal.
