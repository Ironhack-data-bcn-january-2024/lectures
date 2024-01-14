
# error-while-pushing

## Error

- So you forked, cloned, worked on your lab and tried to push your changes.
- You get asked to input your username and password.
- You get this permission error:

```bash
remote: Permission to ANOTHER_USER/REPO.git denied to
 MY_USER.
fatal: unable to access 'https://github.com/ANOTHER_USER/REPO.git/': 
The requested URL returned error: 403
```

## Troubleshooting

You're trying to push changes to a repo you don't have access to. It's either not your repo or it's a repo no one gave you access to.

1. Make sure you're trying to push changes to your forked version, not the original one
2. Fork the repo
3. Copy the link to your forked repo

#### Now you'll have to change the link it points towards: option 1 (commands) 
4. On your cloned repo: `git remote set-url origin NEW_GIT_URL_HERE` 
5. Try to push again

#### Now you'll have to change the link it points towards: option 2 (manually)

4. Navigate into the git folder: `cd .git` 
5. Open the `.config` file
6. Substitue the link to github with the one with your fork