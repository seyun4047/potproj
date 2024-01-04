from django.shortcuts import render
from django.views.generic import ListView
from .models import Post, Post2

# Create your views here.

class landing(ListView):
    model = Post
    ordering = '-pk'
    template_name = 'single_pages/landing.html'
    context_object_name = 'landing_list'

class landing2(ListView):
    model = Post2
    ordering = '-pk'
    template_name = 'single_pages/landing2.html'
    context_object_name = 'landing_list2'
