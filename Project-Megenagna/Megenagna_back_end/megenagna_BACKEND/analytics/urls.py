from django.urls import path,include
from .views import get_analytics


urlpatterns = [ 
          path('<int:id>/',get_analytics),
]