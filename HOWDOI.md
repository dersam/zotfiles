# How Do I...
Collection of common things that I always forget how to deal with

## Fix vim issues
```
Error detected while processing function <SNR>13_InitializePythonBuiltin:
line   23:
E887: Sorry, this command is disabled, the Python's site module could not be loaded.
Press ENTER or type command to continue
```

Uninstall and recompile vim with `brew remove vim && brew install --build-from-source vim`.

```
_arguments:448: _vim_files: function definition file not found
```
https://github.com/robbyrussell/oh-my-zsh/issues/518

Fix:
```
rm ~/.zcompdump*
exec zsh
```
Needs to be run in every open terminal.

## fix the session crashing after the first command after `zot`
Did you reinstall the zsh-users/autosuggestions module? It breaks your terminal
every time stop trying to use it you don't even like it.

## slow git prompt in vm
if [[ -d "/vagrant" ]]; then
	export GIT_PS1_SHOWDIRTYSTATE=
	export GIT_PS1_SHOWUNTRACKEDFILES=
fi
