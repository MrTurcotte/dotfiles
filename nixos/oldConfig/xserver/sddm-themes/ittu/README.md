# IttuSddm

A project to animate your login manager

[![screen](https://git.opendesktop.org/adhe/ittusddm/raw/master/images/img01_crop.png)](https://git.opendesktop.org/adhe/ittusddm/raw/master/images/img01.png)

[![screen](https://git.opendesktop.org/adhe/ittusddm/raw/master/images/img00_crop.png)](https://git.opendesktop.org/adhe/ittusddm/raw/master/images/img00.png)

### Installation 

Download the file *ittu.tar.gz*  and run from your terminal

```bash
sudo tar -xvf ~/Downloads/ittu.tar.gz -C /usr/share/sddm/themes
```

### Usage

Select the theme from the SystemSettings of plasma KDE

SystemSettings  ~> Startup and Shutdown ~> select *ittu* and click on Apply button

### Change animation GIF

Place your favourite animation as **~/.face.gif** in your Home folder.
some examples of animation in:
```bash
/usr/share/sddm/themes/ittu/components/artwork/gifs/
```
Copy, paste and rename as **~/.face.gif**

### Basic configurations

Edit the file  **/usr/share/sddm/themes/ittu/theme.conf** 

```bash
background=components/artwork/background.jpg  #path to file 
blur=true                #true or false, enable blur effect
blurRadius=30            #from 0 to 100, radius of blur 

shape=circle             #circle or rectangle, shape of avatars
avatarTransparent=false  #true or false, draw background of animations 
avatarColor="#dcdcdc"    #background of animations

factorSizeAvatar=0.75    #size of avatars
```

### Coffee

Thanks for all the support :coffee: .

If you liked my job please Pling ![plinghover](https://www.opendesktop.org/images/system/pling-btn-hover.png "") the project or/and rate  (above in the + symbol) or/and make a donation [here](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=V9Q8MK9CKSQW8&source=url)

<a href="https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=V9Q8MK9CKSQW8&source=url" rel="ittu">![Foo](https://git.opendesktop.org/adhe/oie/raw/master/images/donate.png "")</a>


Have fun ;) 

