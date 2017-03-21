#!/bin/bash

# Bash variables
USERNAME="root"
PASSWORD="password"
EMAIL="root@example.com"

prefix="[initialise.sh]"
project_name="main"

function print_help() {
cat << EOF
$0

DESCRIPTION
The script initialises the database for Django and creates a user,
if root or the given user does not exist on the database.

OPTIONS
-h|--help                       Print this help.
-u=*|--user=*                   Create the given user if the user does not exist in the database
                                    (Default: root)
-p=*|--password=*               Use the given password for the user creation.
                                    (Default: password)
-s|--accountskip                Skip the account creation
EOF
}

# Installed Django Apps
apps=( $(python utilities/get_installed_apps_in_directory.py $project_name) )

# Parsing the arguments
for i in "$@"
do
case $i in
    -u=*|--username=*)
    USERNAME="${i#*=}"
    shift
    ;;
    -p=*|--password=*)
    PASSWORD="${i#*=}"
    shift
    ;;
    -e=*|--email=*)
    EMAIL="${i#*=}"
    shift
    ;;
    -s|--account-skip)
    ACCOUNTSKIP=true
    shift
    ;;
    -h|--help)
    print_help
    exit
    shift
    ;;
    *)
    ;;
esac
done

echo "$prefix started."

echo "$prefix update and initialise submodules."
git submodule update --init

# Check if the app static dir exists
echo "$prefix Check the static dirs of the apps."
for app in "${apps[@]}"
do
    if [ ! -d "$app/static" ]
    then
        echo "$prefix Create static dir for $app"
        mkdir "$app/static"
    fi
done

if [ ! -d "static/" ]
then
    echo "$prefix Create static dir for main"
    mkdir "static"
fi

echo "$prefix collectstatic"
python manage.py collectstatic --noinput

echo "$prefix initialise database"
python manage.py migrate
for app in "${apps[@]}"
do
    python manage.py makemigrations $app
done
python manage.py migrate


for app in "${apps[@]}"
do
    if [ ! -z "$app/fixtures" ]
    then
        fixture_files=( $(ls "$app/fixtures") )
        if [ -n "$fixture_files" ]
        then
            echo "$prefix load data into database ($app)"
            for fixture in ${fixture_files[@]}
            do
                python manage.py loaddata $fixture
            done
        fi
   fi
done

if [ ! $ACCOUNTSKIP ]
then
    echo "$prefix create Account"
    export USERNAME
    export PASSWORD
    export EMAIL
    python manage.py shell < createsuperuser.cmd
fi

echo "$prefix finished."
