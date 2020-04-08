from django.db import models

class User(models.Model):
    firstName = models.CharField(max_length=50, null=False)
    lastName = models.CharField(max_length=50, null=False)
	city = models.CharField(max_length=50, null=False)
	createdAt = datetime.datetime.now

    def __str__(self):
        return "{} - {}".format(self.firstName, self.lastName)