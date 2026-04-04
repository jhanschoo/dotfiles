# Agent Instructions

## Git Commit Signing for Automated Commits

When performing automated Git commits, ensure they are signed using the user's dedicated GPG signing subkey by explicitly including the signing flag in the `git commit` command.

-   **GPG Signing Key ID:** `0x4D5966973637A05D` (AI Agent of Johannes Choo)

To sign commits, use the `-S` or `--gpg-sign` flag followed by the Key ID:

```bash
git commit -S0x4D5966973637A05D -m "Your commit message"
```

**Note:** If GPG signing fails (e.g., due to timeout or inaccessible key), do not fallback to unsigned commits. Instead, prompt the user to unlock their `gpg-agent` by running the caching command in their terminal, and then attempt the signed commit again.

## GPG Agent Configuration and Passphrase Caching

At the start of sessions or before performing Git commits, I will proactively remind you to ensure your `gpg-agent` is appropriately configured and running, with the passphrase for the signing key cached, to facilitate successful GPG signing in automated contexts.

To ensure your `gpg-agent` is ready and has cached your passphrase (which will typically trigger a pinentry prompt if needed), you can run a command like this in your terminal:

```bash
echo "Hello" | gpg --clearsign --default-key 0x4D5966973637A05D > /dev/null
```

This command attempts to "clearsign" a simple string using your designated key. If the passphrase isn't cached, your `gpg-agent` should prompt you for it. Once entered, the passphrase will be cached for future use, allowing automated signing to proceed without interruption. Since this is a separate identity from your personal GPG key, you can manage its passphrase independently.

## Python Interpreter Execution

When running the python interpreter, if no interpreter is found, proactively attempt to activate the project's virtual environment (such as `.venv` or `venv`) and then try running the command again.