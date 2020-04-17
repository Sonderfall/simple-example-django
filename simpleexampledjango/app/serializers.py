from rest_framework import serializers
from .models import *

class FUserSerializer(serializers.ModelSerializer):
    class Meta:
        model = FUser
        fields = "__all__"
