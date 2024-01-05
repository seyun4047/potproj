from django.db import models
import os
from django.contrib.auth.models import User

# Create your models here.
class Post(models.Model):
    intro_img = models.FileField(upload_to='intro/images', blank=True)
    title = models.CharField(max_length=255, blank=True)  # title 필드 추가
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def save(self, *args, **kwargs):
        # 파일이 업로드되었을 때 title 필드에 파일 이름 설정
        if not self.title and self.intro_img:
            self.title = self.intro_img.name.split('.')[0]
        super().save(*args, **kwargs)

    def delete(self, *args, **kwargs):
        # 모델이 삭제될 때 연결된 파일도 함께 삭제
        if self.intro_img:
            # 파일 삭제
            file_path = self.intro_img.path
            if os.path.exists(file_path):
                os.remove(file_path)
        super().delete(*args, **kwargs)

    def __str__(self):
        return f'{self.title}              {self.created_at} {self.updated_at}'

    def get_absolute_url(self):
        return f'{self.pk}/'

    class Meta:
        verbose_name_plural = 'Intro_Image'

class Post2(models.Model):
    intro_img = models.FileField(upload_to='intro/images2', blank=True)
    title = models.CharField(max_length=255, blank=True)  # title 필드 추가
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def save(self, *args, **kwargs):
        # 파일이 업로드되었을 때 title 필드에 파일 이름 설정
        if not self.title and self.intro_img:
            self.title = self.intro_img.name.split('.')[0]
        super().save(*args, **kwargs)

    def delete(self, *args, **kwargs):
        # 모델이 삭제될 때 연결된 파일도 함께 삭제
        if self.intro_img:
            # 파일 삭제
            file_path = self.intro_img.path
            if os.path.exists(file_path):
                os.remove(file_path)
        super().delete(*args, **kwargs)

    def __str__(self):
        return f'{self.title}              {self.created_at} {self.updated_at}'


    class Meta:
        verbose_name_plural = 'Intro_Image-seyun'
