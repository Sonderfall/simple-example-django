from django.db import models

class User(models.Model):
    firstName = models.CharField(max_length=50, null=False)
    lastName = models.CharField(max_length=50, null=False)
	city = models.CharField(max_length=50, null=False)
	created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return "{} {}, living at {}".format(self.firstName, self.lastName, self.city)