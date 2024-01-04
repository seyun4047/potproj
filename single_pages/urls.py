from django.urls import path
from . import views

urlpatterns = [
    path('', views.landing.as_view()),
    path('s/', views.landing2.as_view()),
]