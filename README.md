# Simple Webhooks

Webhooks, initialy just a github showcase. Github will not be able to send a "webhook-event" to this webhook-example without a fully qualified domainname or ip-address. For the purpose of testing you are able to use https://ngrok.com. Ngrok is a tool which allows the use of secure introspectable tunnels to localhost webhook development tool and very good debugging tool, in the context of webhooks.

![Github Webhook](https://github.com/finnerds/webhook/blob/master/docs/img/finnerds-webhook.png)

For our webhooks we do need a token. For that reason we add a token provider. Generate server RSA key and run migrations (if you don’t):

    $ python manage.py migrate
    $ python manage.py creatersakey

Keep in mind that you need additionaly either a

    * domainname
    * dyndns-domainname or
    * ip of your router (with NAT setting).
