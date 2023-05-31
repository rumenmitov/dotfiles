# Git 


## Table of Contents 

1. [Setting-up SSH](#Setting\-up-SSH)  
2. [Pulling From Repository](#Pulling-From-Repository)
3. [Pushing Changes](#Pushing-Changes)
4. [Tips & Tricks](#Tips-&-Tricks)
  
  
### Setting-up SSH  

1. Create a key: `ssh-keygen -t rsa -b 4096 -C "example@email.com"`  
2. Activate the key (make sure that you are using *bash*): `eval "$(ssh-agent -s)"`  
  a) Optionally, move the keys (*id_rsa* and *id_rsa.pub*) to **~/.ssh/\<directory of your choice>/**  
4. Insert this in *~/.ssh/config*:  

```
Host *  
 AddKeysToAgent yes  
 IdentityFile ~/.ssh/<directory if it exists>/id_rsa  
```  

4. Run the key: `ssh-add ~/.ssh/<directory if it exists>/id_rsa`  
5. Go to GitHub / Codeberg (in the SSH and GPG Keys section) and create a new SSH key using the contents of the *id_rsa.pub* file  

**NOTE:** If you named your file something other than the default (*id_rsa*), then just use the name of your file  
Check connection: `ssh -T git@github.com`  
And on Codeberg: `ssh -T git@codeberg.org`  

For more info (GitHub):  
[More Info](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)  

For more info (Codeberg):  
[More Info](https://docs.codeberg.org/security/ssh-key/)  


### Pulling From Repository 

If it is a brand new repository:  
`git clone <example_repository_goes_here>`  

If you want to download the latest changes (make sure you `cd` into your repository):  
`git pull`  

*TIP:** If you want to see if there are changes to the codebase without pulling them, use:  
`git fetch`  

  
### Pushing Changes  

```sh  
cd <example_repository_goes_here>  
git add .  
git commit -m "example comment to describe changes"  
git push   
```  
  
**NOTE:** If your branch is not named *main*, then use the name of your branch  

**NOTE:** To switch to a _new branch_ use `git checkout -b <name of branch>`. For an existing branch use `git checkout <name of branch>`  

If you want to merge two branches, use:  
```sh
git checkout <base branch>  
git merge <incoming branch>  
```  

**TIP:** When merging you can use _vim_ to settle conflicts:  
`git config merge.tool vimdiff`  


### Tips & Tricks 

**TIP:** Use `git commit -a` to be able to write multi-line comments! Just make sure that you set:  
`git config --global core.editor vim`
  
**TIP:** Use `git config --global diff.tool vimdiff` to set vim as your diff tool.  
  

