**Git about**
Git is an open-source tool, which is a distributed version control system used for tracking
changes in computer files. It is generally used for source code management in software
development.

**Git Main components **
Git has several main components that work together to manage source code and track
changes efficiently. Here are the key components of Git:
1. Repository (Repo):
o A Git repository is a collection of files and directories along with the version
history of those files.
o It can be local (on your machine), remote (on a server or hosted service like
GitHub), or both (a local repository connected to one or more remote
repositories).
2. Working Directory:
o The working directory is the directory on your local machine where you're
actively making changes to the files.
o It contains the files you're currently working on.
3. Index (Staging Area):
o The index, also known as the staging area, is a middle ground where changes
to files are marked before committing them to the repository.
o It allows you to selectively include or exclude changes before committing
them.
4. Commit:
o A commit is a snapshot of the changes made to the files in the repository at a
specific point in time.
o Each commit has a unique identifier (hash) and includes information about the
changes, the author, and a reference to its parent commit(s).
5. Branch:
o A branch is a movable pointer to a specific commit. It allows for parallel
development, isolation of changes, and easy merging of different lines of
development.
o Branches are lightweight and can be created, switched between, and merged
easily.
6. HEAD:
o HEAD is a special pointer that points to the latest commit in the branch you
are currently working on.
o It represents the latest state of your working directory and the commit you'll
start from for the next changes.
7. Remote:
o A remote is a reference to a repository on a network, usually on a server. It
could be on a hosting service like GitHub or a company server.
o Remote repositories allow collaboration and sharing of code between multiple
developers.
8. Clone:
o Cloning is the process of creating a local copy of a remote repository. This is
often done when you want to start working on an existing project or
collaborate with others.
9. Fetch:
o Fetching is the process of getting changes from a remote repository without
merging them into your local branches. It updates your local repository with
changes made by others.
10. Pull:
o Pulling is a combination of fetching and merging. It gets changes from a
remote repository and automatically merges them into your current branch.
11. Push:
o Pushing is the process of sending your committed changes to a remote
repository. It makes your changes available to others and updates the remote
repository.
12. Conflicts:
Conflicts occur when Git cannot automatically merge changes. Resolving
conflicts involves manually editing the conflicting files.
13. Gitignore:
The .gitignore file specifies files and directories that should be ignored by
Git, such as build artifacts and temporary files.
14. Rebase:
Rebase is an alternative to merging that integrates changes from one branch
into another by applying each commit in sequence.
15. Merging:
Merging combines changes from different branches into a single branch.
Use git merge to merge changes from one branch into another.
16. Tagging:
Tags are references to specific points in Git history, often used to mark release
points. You can create tags using git tag.

**Git branching strategy**
One of the key features of Git is its branching system, which allows developers to create
multiple branches of the codebase, working independently, and then merge them back into
the main branch.
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
Master = prod
develop = Master + Feature modules
Short -lived branches include:
release
feature
hotfix
2. Feature Branching Strategy.
Master= Prod
Integration = CI-CD

**Getting Started - Installing Git**
** For Installing on Linux **
sudo dnf install git-all
** For Installing on Ubuntu**
sudo apt install git-all
** For check on git version **
git --version

**Getting Started - Git configuration**
** Git config command **
git config --global user.name "Your Name" - Sets your username for commits.
git config --global user.email "youremail@example.com" - Sets your email address for
commits.
** To list all global configuration settings **
git config --global --list
** To list all local repository-specific configuration settings**
git config --list

**Getting Started - Git Commands**
**Repository Creation**
git init : Initializes a new Git repository in the current directory.
**Cloning and Remote Repositories**
git clone : Copies an existing Git repository from a remote server to your local machine.
git remote -v : Lists the remote repositories associated with the current repository.
git remote add <name> <repository_url> : Add a new remote repository.
**Basic Operations**
git add : Stages a file for the next commit.
git add . : Stage all changes in the current directory and subdirectories.
git commit -m "commit message" : Records the staged changes with a commit message
describing the changes made.
git status : Displays the current state of the working directory, showing modified, staged, and
untracked files.
git diff : Shows the differences between the working directory and the last committed
version.

**Branching and Merging**
git branch : The current branch is highlighted.
git branch -r : Lists all branches in the repository.
git checkout <branch> : Switches to the specified branch.
git checkout -b "existing branch" "your new branch name" : Create and switch to a new
branch named "your new branch name" from existing branch
git push origin "branch name" : Pushes local commits to a remote repository.
git merge <branch> <branch> : Merges changes from the specified branch into the current
branch.
git pull Fetches changes from a remote repository and merges them into the current branch.

**History and Commits**
git log : Displays the commit history, showing the author, date, and commit message for each
commit.
git reset <file> : Un stages a file, removing it from the staging area.
git reset --hard HEAD : Discards all local changes and resets the working directory to the
last committed version.
git rm <file> : Removes a file from the working directory and stages the removal for the next
commit.
git revert <commit> - Create a new commit that undoes changes from a specific commit.

**Remote Operations**
git fetch : Fetch updates from the remote repository (origin) for the currently checked out
branch
git pull : Fetch and merge changes from a remote branch

**Stashing Changes**
git stash apply : Apply the most recent stash.
git stash pop : Apply and remove the most recent stash.
git stash : Stash your changes, allowing you to switch to a different branch or perform other
actions.

**Tagging**
git tag : List tags in the repository.
git tag <tag_name>: Create a lightweight tag for the current commit.
git tag -a <tag_name> -m "tag message": Create an annotated tag with a message.

**Delete Branch**
git branch -D <branch-name> : Deleting a branch named <branch-name>
git branch -m <branch-name> <new-branch-name> : Rename the branch <branch-name>
<new-branch-name>Type equation here.