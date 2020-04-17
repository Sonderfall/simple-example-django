from rest_framework import viewsets
from .models import *
from .serializers import *

# Will do CRUD base operations
class FUserView(viewsets.ModelViewSet):
    queryset = FUser.objects.all()
    serializer_class = FUserSerializer
