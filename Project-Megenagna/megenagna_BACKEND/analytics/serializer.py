from rest_framework import serializers
from .models import Analytics

class AnalyticSerializer(serializers.Serializer):
  class Meta:
    model=Analytics
    fields='__all__'