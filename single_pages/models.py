from django.db import models
import os
import cv2
from django.core.exceptions import ValidationError
from django.shortcuts import get_object_or_404
from django.http import JsonResponse
from django.contrib.auth.models import User
# from .resizing_img import ResizeImg

# Create your models here.

# def validate_file_size(value):
#     max_size = 10 * 1024 * 1024
#
#     if value.size > max_size:
#         raise ValidationError("File size error")

class Post(models.Model):
    # intro_img = models.FileField(upload_to='intro/images', blank=True, validators=[validate_file_size])
    intro_img = models.FileField(upload_to='intro/images', blank=True)
    title = models.CharField(max_length=255, blank=True)  # title 필드 추가
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def resizeImg(self, imgSrc, outSrc):
        inputImg = cv2.imread(imgSrc)
        oriH, oriW = inputImg.shape[:2]
        # if oriH>1000 or oriW>600:
        resizedImg = cv2.resize(inputImg, (int(oriW*0.5), int(oriH*0.5)), interpolation=cv2.INTER_AREA)
        cv2.imwrite(outSrc,resizedImg)
        cv2.waitKey(0)
        cv2.destroyAllWindows()

    def save(self, *args, **kwargs):
        # 파일이 업로드되었을 때 title 필드에 파일 이름 설정
        if not self.title and self.intro_img:
            self.title = self.intro_img.name.split('.')[0]
        super().save(*args, **kwargs)
        if self.intro_img.size > 10 * 1024 * 1024:
            image_path = self.intro_img.path
            output_path = f"{image_path.split('.')[0]}.{image_path.split('.')[-1]}"
            self.resizeImg(image_path, output_path)
    def delete(self, *args, **kwargs):
        # 모델이 삭제될 때 연결된 파일도 함께 삭제
        if self.intro_img:
            # 파일 삭제
            file_path = self.intro_img.path
            if os.path.exists(file_path):
                os.remove(file_path)
        super().delete(*args, **kwargs)




    def __str__(self):
        return f'{self.pk} {self.title}              {self.created_at} {self.updated_at}'

    def get_absolute_url(self):
        return f'/{self.pk}/'

    class Meta:
        verbose_name_plural = 'Intro_Image'

class Post2(models.Model):
    intro_img = models.FileField(upload_to='intro/images2', blank=True)
    title = models.CharField(max_length=255, blank=True)  # title 필드 추가
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def resizeImg(self, imgSrc, outSrc):
        inputImg = cv2.imread(imgSrc)
        oriH, oriW = inputImg.shape[:2]
        # if oriH>1000 or oriW>600:
        resizedImg = cv2.resize(inputImg, (int(oriW*0.5), int(oriH*0.5)), interpolation=cv2.INTER_AREA)
        cv2.imwrite(outSrc,resizedImg)
        cv2.waitKey(0)
        cv2.destroyAllWindows()

    def save(self, *args, **kwargs):
        # 파일이 업로드되었을 때 title 필드에 파일 이름 설정
        if not self.title and self.intro_img:
            self.title = self.intro_img.name.split('.')[0]
        super().save(*args, **kwargs)
        if self.intro_img.size > 10 * 1024 * 1024:
            image_path = self.intro_img.path
            output_path = f"{image_path.split('.')[0]}.{image_path.split('.')[-1]}"
            self.resizeImg(image_path, output_path)

    def delete(self, *args, **kwargs):
        # 모델이 삭제될 때 연결된 파일도 함께 삭제
        if self.intro_img:
            # 파일 삭제
            file_path = self.intro_img.path
            if os.path.exists(file_path):
                os.remove(file_path)
        super().delete(*args, **kwargs)


    def get_absolute_url(self):
        return f'/s/{self.pk}/'

    def __str__(self):
        return f'{self.pk} {self.title}              {self.created_at} {self.updated_at}'


    class Meta:
        verbose_name_plural = 'Intro_Image-seyun'
