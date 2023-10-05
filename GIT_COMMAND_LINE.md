# How to use git with the command line

This is not mandatory course material! If you are more comfortable using the JupyterLab git interface shown in the worksheet and textbook, please use [Jupyter Open](https://open.jupyter.ubc.ca/)!

**List of useful terminal commands**

- `ls`: "listing", list the files and directories in the current directory
- `pwd`: "present working directory" print out the absolute path of the current directory
- `cd /some/directory/path`: "change directory", takes a relative or absolute path, and changes your location to that directory

**List of git commands to know**

- `git status`: show the list of files you have changed, and which files are currently staged
- `git add filename.md`: move the file `filename.md` to the staging area
- `git commit -m "type your commit message here"`: commit the changes that are currently in the staging area
- `git push`: push local commits to the remote repository (on github.com)
- `git pull`: pull new changes from the remote repository (on github.com) onto your local computer (or the server)

## Steps to clone a repository

1. From the JupyterLab page, open a new tab ("Launcher") and open a terminal
2. **(IMPORTANT)** Run `pwd`. You want to make sure you are **NOT** anywhere in the `dsci-100-student` folder!
   - If you are in `/home/jovyan/work`, you're good!
   - If you are NOT in `/home/jovyan/work`, run `cd /home/jovyan/work` to move yourself into the `work` directory
3. Copy the repository clone link from github.com (blue code button -> copy)
4. Run `git clone https://github.com/mgyliu/dsci-100-demo-f23.git`, **replacing the link with your repo's link**.

After running these steps, you should see a folder called `your_repository` (for me, that is `dsci-100-demo-f23`). If you run `ls`, your terminal should show you something like this:

```
(base) jovyan@00d39b76cde3:~/work$ ls
dsci-100-demo-f23  dsci-100-student
```

## Steps to add, commit, and push changes from your local repository to github.com

1. `cd dsci-100-demo-f23`: Go into your project directory.
2. Make some changes to files in your project directory & save. Example: say I changed `README.md`
3. `git status`: Check which files were changed. `README.md` should show up in red.
4. `git add README.md`: Add this file to the staging area.
5. `git status`: Check which files were changed. `README.md` should show up in green (indicating that it has been staged).
6. `git commit -m "Update README.md"`: Commit the changes with a message.
7. `git push`: Push the commit to the remote repository. Now your changes can be seen on github.com

## How to pull changes from github.com to your local computer/server

1. `git pull`: Pull any new changes from the remote repository to your local computer.

## If you are prompted with `git config --global ...`

You might be asked to authenticate yourself when you try to commit for the first time. Follow the instructions on screen to set up your email and name (not username!). You will have to run the commit command again after configuring your email and name.

## If you are prompted to log in with username/password

- Enter your github.com username
- Enter your **personal access token** (NOT your password)
  - If you don't know what this is, refer to the textbook
  - When you Control/Cmd+V to paste it, it will not show up. This is for security reasons. You can paste it once and Enter.
