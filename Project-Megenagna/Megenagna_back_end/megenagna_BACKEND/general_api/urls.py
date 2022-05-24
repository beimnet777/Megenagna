from django.urls import path,include
from .views import EmployeeView,EmployerView,JobViewSet
from rest_framework.routers import DefaultRouter

router=DefaultRouter()
router.register('jobs',JobViewSet,basename='job')

urlpatterns = [
            path('',EmployeeView.as_view()),
            path('employer/',EmployerView.as_view()),
          path('api/v1/model/',include(router.urls))
]
