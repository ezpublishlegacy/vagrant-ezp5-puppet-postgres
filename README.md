# vagrant:ezp5:puppet:postgres

Prototype development machine for eZ Publish 5.x, provisioned with Puppet and Postgres

## Stack & utilities:

- CentOS 6.4 x64
- Apache 2.2.15
- Postgres 8.4.13
- PHP 5.3.3
- APC 3.1.13
- Xdebug 2.2.3 or not, this is your choice through Vagrantfile setup
- Composer
- eZ Publish 5 Community 2013.07

## Requirements:

- Vagrant (http://vagrantup.com)
- VirtualBox (https://www.virtualbox.org/) or VMWare (http://www.vmware.com/)

## Getting started:

- Clone this project to a directory 
- Run `$ vagrant up` from the terminal
- Wait (the first time will take a few minutes, as the base box is downloaded, and required packages are installed for the first time), get some coffee.
- Done! `$ vagrant ssh` to SSH into your newly created machine. The MOTD contains details on the database, hostnames, etc.
- By default Xdebug is enable, if you want to disable it, go to line 55 of Vagrantfile comment it and uncomment line 58. Don't forget to run `$ vagrant up` after

## Environment Details:

```
Postgres:
  default database: ezp
  default db user: ezp
  default db user password: ezp

Apache/httpd: www root: /var/www/html

eZ Publish 5 Project:
  location: /var/www/html/ezpublish5
  hostname: ezp5.dev.vagrant or ezp5.prod.vagrant
  admin hostname: admin.ezp5.dev.vagrant or admin.ezp5.prod.vagrant
  environment: dev or prod
```

## COPYRIGHT
Copyright (C) 1999-2013 eZ Systems AS. All rights reserved.

## LICENSE
http://www.gnu.org/licenses/gpl-2.0.txt GNU General Public License v2