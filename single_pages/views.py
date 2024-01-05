from django.shortcuts import render
from django.views.generic import ListView, DetailView
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

# class PostDetail(DetailView):
#     model = Post2
#     template_name = 'single_pages/landing2_detail.html'
#     def get_context_data(self, **kwargs):
#         context = super(PostDetail, self).get_context_data()
#         return context


def singlePost(request, pk):
    post = Post.objects.get(pk=pk)

    return render(
        request,
        'single_pages/landing_detail.html',
    {
        'post': post
    }
    )

def singlePost2(request, pk):
    post = Post2.objects.get(pk=pk)

    return render(
        request,
        'single_pages/landing2_detail.html',
    {
        'post2': post
    }
    )