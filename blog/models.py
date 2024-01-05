from django.db import models
from django.contrib.auth.models import User
import os
# Create your models here.

class Category(models.Model):
    name = models.CharField(max_length=50, unique=True)
    slug = models.SlugField(max_length=200, unique=True, allow_unicode=True)
    def __str__(self):
        return self.name

    def get_absolute_url(self):
        return f'/blog/category/{self.slug}/'
    class Meta:
        verbose_name_plural = 'Categories'

class Post(models.Model):
    title = models.CharField(max_length=30)
    hook_text = models.CharField(max_length=100, blank=True)
    content = models.TextField()
    head_image = models.ImageField(upload_to='blog/images/%Y/%m/%d/', blank=True)
    file_upload = models.FileField(upload_to='blog/images/%Y/%m/%d/', blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    # author = models.ForeignKey(User, on_delete=models.CASCADE)
    author = models.ForeignKey(User, null=True, on_delete=models.SET_NULL)

    category = models.ForeignKey(Category, null=True, on_delete=models.SET_NULL)
    def __str__(self):
        return f'[{self.pk}] {self.title} {self.created_at} {self.updated_at} :: {self.author}'

    def get_absolute_url(self):
        return f'/blog/{self.pk}/'

    def delete(self, *args, **kwargs):
        # 모델이 삭제될 때 연결된 파일도 함께 삭제
        if self.head_image:
            # 파일 삭제
            file_path = self.head_image.path
            if os.path.exists(file_path):
                os.remove(file_path)

        if self.file_upload:
            # 파일 삭제
            file_path = self.file_upload.path
            if os.path.exists(file_path):
                os.remove(file_path)
        super().delete(*args, **kwargs)