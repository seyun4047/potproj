from django.shortcuts import render
from django.views.generic import ListView
from .models import Post

# Create your views here.

class landing(ListView):
    model = Post
    ordering = '-pk'
    template_name = 'single_pages/landing.html'
    context_object_name = 'landing_list'
