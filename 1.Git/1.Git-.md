**Git about**
Git is an open-source tool, which is a distributed version control system used for tracking changes in computer files. It is generally used for source code management in software development.

**Git branching strategy**
One of the key features of Git is its branching system, which allows developers to create multiple branches of the codebase, working independently, and then merge them back into the main branch.

Below points are covered in the entire strategy:

1. Name
2. Long-lived branches & Short-lived branches
3. Source and destination
4. Merging and how to promote code to production
5. Conflicts

There are two types of branching strategies:
1. Git Model Branching Strategy.
2. Feature Branching Strategy.


 1. Git Model Branching Strategy. 
 Long-lived branches include:
 Master   = prod
 develop  = Master + Feature modules

Short -lived branches include:
release 
feature
hotfix 

 2. Feature Branching Strategy.
 Master= Prod
 Integration = CI-CD


**Getting Started - Installing Git**
**  For Installing on Linux **
 sudo dnf install git-all
**  For Installing on Ubuntu**
sudo apt install git-all
**  For check on git version **
git --version


**Getting Started - Git configuration**

**  Git config command **
 git config --global user.name "Your Name" - Sets your username for commits.
 git config --global user.email "youremail@example.com" - Sets your email address for commits.

** To list all global configuration settings **
git config --global --list
**  To list all local repository-specific configuration settings**
git config --list

**Getting Started - Git Commands**

**Repository Creation**

git init - Initializes a new Git repository in the current directory. 

**Cloning and Remote Repositories**

git clone <repository_url> - Copies an existing Git repository from a remote server to your local machine.

git remote -v - Lists the remote repositories associated with the current repository.

git remote add <name> <repository_url> - Add a new remote repository.

**Basic Operations**

git add <file> - Stages a file for the next commit.

git add . Stage all changes in the current directory and subdirectories.

git commit -m "commit message" - Records the staged changes with a commit message describing the changes made.

git status - Displays the current state of the working directory, showing modified, staged, and untracked files.

git diff - Shows the differences between the working directory and the last committed version.

**Branching and Merging**

git branch -  The current branch is highlighted.

git branch -r - Lists all branches in the repository. 

git checkout <branch> - Switches to the specified branch.

git checkout -b "existing branch" "your new branch name"  Create and switch to a new branch named "your new branch name" from existing branch

git push origin "branch name" - Pushes local commits to a remote repository.

git merge <branch> - Merges changes from the specified branch into the current branch.

git pull - Fetches changes from a remote repository and merges them into the current branch.

**History and Commits**

git log - Displays the commit history, showing the author, date, and commit message for each commit.

git reset <file> - Unstages a file, removing it from the staging area.

git reset --hard HEAD - Discards all local changes and resets the working directory to the last committed version.

git rm <file> - Removes a file from the working directory and stages the removal for the next commit.

git revert <commit> - Create a new commit that undoes changes from a specific commit.

**Remote Operations**

git fetch   Fetch updates from the remote repository (origin) for the currently checked out branch

git pull <remote> <branch>: Fetch and merge changes from a remote branch

**Stashing Changes**

git stash apply - Apply the most recent stash.

git stash pop - Apply and remove the most recent stash.

git stash   Stash your changes, allowing you to switch to a different branch or perform other actions.

**Tagging**

git tag  List tags in the repository.

git tag <tag_name>: Create a lightweight tag for the current commit.

git tag -a <tag_name> -m "tag message": Create an annotated tag with a message.

**Delete Branch**

git branch -d <branch-name> Deleting a branch named <branch-name>

git branch -m <branch-name> <new-branch-name>  Rename the branch <branch-name> <new-branch-name>