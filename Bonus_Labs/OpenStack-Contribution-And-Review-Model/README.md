###Exercise 19.4 Upload a patch with dependency###

####Overview:####

In this exercise, we will upload a patch that depends on another patch in sandbox project.

**Task 1**: Create two directories Repo1 and Repo2 in home directory

**Task 2**: Clone the sandbox project in $HOME/Repo1 and $HOME/Repo2

**Task 3**: Configure the git in $HOME/Repo1/ci-sandbox/

**Task 4**: Create a new branch "lf-testing" in $HOME/Repo1/ci-sandbox/

**Task 5**: Create a new file "lf-test1.txt" in branch "lf-testing" and add some contents in file

**Task 6**: Add and commit changes and upload patch1. Note the review number

**Task 7**: Configure the git in $HOME/Repo2/ci-sandbox/ with patch1 as the dependency. To add dependency,

Use 'git review -d <patch1 review number>'

**Task 8**: Create a new branch "lf-testing-2" in $HOME/Repo2/ci-sandbox/ directory

**Task 9**: Create a new file "lf-test2.txt" in branch "lf-testing-2" and add some contents in file

**Task 10**: Add and commit changes and upload patch2

**Required Setup**:

* item Ubuntu 14.04 LTS virtual machine
* item Trainee should have Launchpad credentials
* item Trainee should use his Launchpad credentials(email and password) to configure Gerrit Code review system with following:
  * item Gerrit username
  * item ICLA
  * item OpenStack Foundation Membership for preferred email address
  * item Contact information
* item Git should be installed
  * item sudo apt-get install git



###Exercise 19.5 Elaboration of Blueprint named "add cinder backup driver for Google cloud storage"###

####Overview:####

This exercise helps you to know about Launchpad Blueprint 'add cinder backup driver for Google cloud storage'. Launchpad blueprints are used to track the implementation of significant features in OpenStack. Open the
Blueprint https://blueprints.launchpad.net/cinder/+spec/gcs-cinder-backup-driver in the browser and do the following tasks

**Task 1**: Who registered the Blueprint and when?

**Task 2**: What is the status of the Blueprint and for which project it is registered?

**Task 3**: To whom it is assigned?

**Task 4**: Name the release of the project for the proposed feature of this Blueprint?

**Task 5**: How many patches are uploaded in the Blueprint?

**Task 6**: Go through one patch and read the comments which are added by users

**Required Setup**:

Browser with internet connectivity


###Exercise 19.6 Elaboration of Blueprint named "python-neutronclient for cisco Dynamic Fabric###

###Automation Support"###

####Overview:####

This exercise helps you to know about Launchpad Blueprint 'python-neutronclient for cisco Dynamic Fabric
Automation Support'. Open the Blueprint https://blueprints.launchpad.net/python-neutronclient/+spec/
python-neutronclient-for-cisco-dfa in the browser and do the following tasks.

**Task 1**: Who registered the Blueprint and when?

**Task 2**: What is the status of the Blueprint and for which project it is registered?

**Task 3**: To whom it is assigned?

**Task 4**: Name the release of the project for the proposed feature of this Blueprint?

**Task 5**: How many patches are uploaded in the Blueprint?

**Task 6**: Go through one patch and read the comments which are added by users

**Required Setup**:

Browser with internet connectivity
