# NBMP

## Introduction

"NBMP" stands for "NetBSD Bozohttpd Mariadb PHP". It's the equivalent of "LAMP" term for "Linux Apache MariaDB PHP" used for web developpment.

This smolBSD service provides Bozohttpd, MariaDB, PHP and minimal dependencies to let you do some web developpement, tests, POC, etc... on smolBSD.

Therefore, the build of the microvm take some time just like the launch because of the weight of MariaDB compared with the speed of smolBSD.

Moreover, each launch drop existing databases and loads `.sql` files in MariaDB. So, the time to arrival is stretched. See "§ Prerequisites" to avoid it.

Concerning `www` files as well as `.sql` files, they are all stored in a local folder on your filesystem. It's mounted to the microvm on `/mnt` and bozohttpd has his `slashdir` (`DocumentRoot` folder) on it. Consequently, every file you put/change/delete into it is instantly put/changed/deleted on the microvm.


## Prerequisites
Essential/minimal packages to run NBMP stack correctly are listed in the `options.mk` file. smolBSD downloads packages from [http://cdn.netbsd.org/pub/pkgsrc/packages/NetBSD/x86_64/11.0/All/](http://cdn.netbsd.org/pub/pkgsrc/packages/NetBSD/x86_64/11.0/All/). Check this page to know the version-named package of php you need. There is no meta-package to installing the latest version like `pkgin install php`.

For now, it's `php84`, `php84-curl`, etc... Edit `options.mk` file to install other php modules. Don't forget to edit `service/nbmp/postinst/postinstall.sh` to enable them in `php.ini` file.

Also, feel free to edit `etc/nbmp.conf` file as needed.

Concering your web developpement files :
- put your `.sql` files in the `service/nbmp/files/sql` folder
- put your `www` files (`.php`, `.html`, etc...) in `service/nbmp/files/www`

If you want to keep existing data in the database, before `./startnb.sh`, create an empty file named `nodeletesql` in the `sql` folder :
```sh
touch service/nbmp/files/sql/nodeletesql
```
Don't forget to delete it to could load `.sql` files again in MariaDB during next launch.

`index.php` and `info.php` as well as `.sql` scripts present by default with this service stands for example and can be deleted.

## Usage
Building on GNU/Linux or MacOS
```sh
$ bmake SERVICE=nbmp build
```
Building on NetBSD
```sh
$ make SERVICE=nbmp base
```

Start the service:
```sh
./startnb.sh -f etc/nbmp.conf
```

Finally, go to [http://localhost:8180](http://localhost:8180) and enjoy

Press `Ctrl+a x` to quit and close the microvm.

Service made with ❤.
