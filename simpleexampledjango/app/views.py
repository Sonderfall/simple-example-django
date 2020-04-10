from rest_framework import viewsets
from .models import *
from .serializers import *

# Will do CRUD base operations
class UserView(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer
