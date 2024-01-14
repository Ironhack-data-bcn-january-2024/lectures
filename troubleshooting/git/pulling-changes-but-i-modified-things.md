# pulling-changes-but-i-modified-things

## Error

- You cloned something (like the lectures repo)
- You coded-along for practice
- You then git pulled to update the changes
- But now you have your version and the class version
- You then get a conflict that looks like this:

```bash
error: Your local changes to the following files would be overwritten by merge:
REPO/main.git
Please, commit your changes or stash them before you can merge.
```

# Troubleshooting

```bash
git stash #this will save without commiting
git pull # this will update and OVERWRITE (delete your previous changes)
```
