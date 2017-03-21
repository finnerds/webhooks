from django.conf.urls import url
from views import github_ping

urlpatterns = [
    url(r'^ping/$', github_ping, name='webhook_github_ping')
]
