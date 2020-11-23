from django.conf.urls import url, include
from .views import github_ping

urlpatterns = [
    url(r'^github_ping/$', github_ping, name='webhook_github_ping'),
]
