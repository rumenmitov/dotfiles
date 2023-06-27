# Pass  
  
  
## Table of Contents
  
1. [Preresequites](#Prerequisites)
2. [Extracting on New Device](#Extracting-on-New-Device)
  

### Prerequisites
  
1. Install **pass**, **vi** and **git**
2. Login to your code repository and [create a SSH key for your device](./git.md/Setting\-up-SSH)
  

### Extracting on New Device
  
1. Clone your passwords repository
2. Find the directory with the *private.pgp* and *public.pgp* files
3. Run: `gpg --import private.pgp` and enter master password
4. Run: `gpg --import public.pgp`
5. To encrypt new passwords on device run: `gpg --edit-key example@email.com`
6. Type *trust* into the prompt and allow maximum trust level (i.e. level 5)
7. Type *save* into the prompt to exit
  

