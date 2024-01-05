from django.urls import path
from . import views

urlpatterns = [
    path('', views.landing.as_view()),
    path('<int:pk>/', views.singlePost),
    path('s/', views.landing2.as_view()),
    path('s/<int:pk>/', views.singlePost2),
    # path('s/<int:pk>/', views.PostDetail.as_view()),
]