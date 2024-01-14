# Authentication failed while pushing - I need a token

## Error

- So you forked, cloned, worked on your lab and tried to push your changes.
- You get asked to input your username and password.
- You input your github username and your github password
- You get an authentication error

```bash
remote: Invalid username or password.
fatal: Authentication failed for 'https://github.com/REPO’
```

## Troubleshooting

That's because you need to use a token instead of your password. Here's the steps:

1. Go to github
2. Go to your profile > settings
3. Scroll down to developer settings
4. Generate new token (classic)
5. Make sure the first box is checked
6. Scroll down and generate new token
7. Copy your new token somewhere on your computer
8. Repeat the pushing process: use your github user and then paste your token into terminal
9. Everything should push normally 🙂
