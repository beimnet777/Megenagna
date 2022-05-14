from django.urls import path
from .views import EmployeeView,EmployerView,JobView

urlpatterns = [
            path('',EmployeeView.as_view()),
            path('employer/',EmployerView.as_view()),
            path('job/',JobView.as_view())
]
