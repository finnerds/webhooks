# webhook
Simple Webhooks


For our webhooks we do need a token. For that reason we add a token provider. Generate server RSA key and run migrations (if you don’t):

    $ python manage.py migrate
    $ python manage.py creatersakey

