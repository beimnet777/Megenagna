from django.urls import path,include
from .views import EmployeeProfileView,EmployerProfileView,JobViewSet
from rest_framework.routers import DefaultRouter

router=DefaultRouter()
router.register('jobs',JobViewSet,basename='job')
router.register('employer',EmployerProfileView,basename='employer')
router.register('employee',EmployeeProfileView,basename='employee')

urlpatterns = [ 
          path('api/v1/model/',include(router.urls))
]
