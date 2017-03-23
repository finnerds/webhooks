from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^github_ping/$', views.github_ping, name='github_ping'),
    url(r'^openid/', include('oidc_provider.urls', namespace='oidc_provider')),
]
