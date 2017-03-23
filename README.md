<<<<<<< HEAD
# webhook

Simple Webhooks, initialy for a github showcase. Keep in mind that you need to use

    * domainname
    * dyndns-domainname or
    * ip of your router (with NAT setting).

Github will not be able to send a "webhook-event" to this webhook-example without a fully qualified domainname or ip-address.


For our webhooks we do need a token. For that reason we add a token provider. Generate server RSA key and run migrations (if you don’t):

    $ python manage.py migrate
    $ python manage.py creatersakey
