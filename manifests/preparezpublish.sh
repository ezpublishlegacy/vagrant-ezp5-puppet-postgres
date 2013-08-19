#!/bin/bash

WWW=/var/www/html
EZPUBLISH=http://share.ez.no/content/download/152505/900457/version/1/file/ezpublish5_community_project-2013.07-gpl-full.tar.gz
EZPUBLISH_FOLDER=ezpublish5

function geteZPublish {
    cd $WWW
    /usr/bin/wget $EZPUBLISH
}

function extracteZPublish {
    cd $WWW
    /bin/tar xzf ezpublish5_community_project-2013.07-gpl-full.tar.gz
}

function rename {
    cd $WWW
    /bin/mv /var/www/html/ezpublish5_community_project-2013.7-gpl-full/ $WWW/$EZPUBLISH_FOLDER
}

function preparePermissions {
    cd $WWW/$EZPUBLISH_FOLDER
    /usr/bin/setfacl -R -m u:apache:rwx -m u:apache:rwx ezpublish/{cache,logs,config} ezpublish_legacy/{design,extension,settings,var} web
    /usr/bin/setfacl -dR -m u:apache:rwx -m u:vagrant:rwx ezpublish/{cache,logs,config} ezpublish_legacy/{design,extension,settings,var} web
}

function assets {
    cd $WWW/$EZPUBLISH_FOLDER
    /usr/bin/php ezpublish/console assets:install --symlink web
    /usr/bin/php ezpublish/console ezpublish:legacy:assets_install --symlink web
    /usr/bin/php ezpublish/console assetic:dump
}

if [ ! -d $WWW/$EZPUBLISH_FOLDER ]; then
    geteZPublish
    extracteZPublish
    rename
    preparePermissions
    assets
fi
