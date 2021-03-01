# Statistics 4 HEP #

Statistics4HEP is a simple bash-shell script that computes the statistical discovery and exclusion significance for given signal and background number of events even in the presence of uncertainties in the background.

### How to use it. ###

The use of the script is very simple as it does not need any installation. The procedure is as follows in the terminal:

~~~
chmod 777 statistics4HEP.sh

./statistics4HEP.sh
~~~

The script will ask the user which modality of significance is going to be used, with or without uncertainties in the background.

~~~
Select an option

1: Significance without uncertainties.
2: Significance with uncertainties.
~~~

Once the user chooses an option the script will ask the user for the number of signal events:
~~~
Enter the number of signal events:
~~~
Once the user introduces the signal events and press `enter` the script will ask for the number of background events.
~~~
Enter the number of background events:
~~~

And in the case of option 2 where the significance contains uncertainties the script will ask the user for the uncertainties.

~~~
Enter the value of the uncertainty:
~~~

Once all the values are introduced the script will deliver the exclusion and discovery significance together with the approximations.

An explanation of the equations used to calculate the exclusion and discovery signicances and also the approximations can be found in the statistical notes included in:

https://github.com/vmlozano/statistics4HEP/blob/master/notes/statistics_HEP.pdf
