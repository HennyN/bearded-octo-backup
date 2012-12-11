#!/bin/bash
########################################################################
#
# 2012-12-11
# Jannette Mensch
# jane@design-mensch.de
#
########################################################################
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.
#
########################################################################
#
# This script will backup the backup files (including the database file) 
# that uberspace.de (shared webshosting company) offeres for your user account.
# In addition does this script create a log file of this transfer.
#
########################################################################

# uberspace user account name
# USER=fnightingale
USER=

# uberspace server name
#SERVER=neon.uberspace.de
SERVER=

# file path for your files and log file
#BACKUPPATH=/home/fnightingale/Dropbox/$USER-backup
BACKUPPATH=

# file path for your database backup files
#BACKUPPATHDB=/home/fnightingale/Dropbox/$USER-backup/db
BACKUPPATHDB=


rsync -r -av --progress --delete --log-file=$BACKUPPATH/$USER_$(date -I)_backup-files.log $USER@$SERVER:/backup/daily.1/var/www/virtual/$USER/* $BACKUPPATH/.
rsync -r -av --progress --log-file=$BACKUPPATH/$USER_$(date -I)_backup-dbs.log $USER@$SERVER:/mysqlbackup/latest/$USER/* $BACKUPPATHDB/.

