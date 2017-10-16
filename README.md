I am not an expert creating scripts for these kind of stuff, so please use it on your own risk.

If you have a better choice, please let me know or create a PR.

Currently,

configure.sh is checking subfolders and
1) if it finds instal.sh it runs it first
2) if there is any bash_local it creates a file in your home dir, and includes it in the bash_profile
