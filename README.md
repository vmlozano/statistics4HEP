# Statistics 4 HEP #

Statistics4HEP is a simple bash-shell script that computes the statistical discovery and exclusion significance for given signal and background number of events even in the presence of uncertainties in the background.

### How to use it.

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


The script will ask the user for the number of signal events:
~~~
Enter the number of signal events:
~~~
Once the user introduces the signal events and press `enter` the script will ask for the number of background events.
~~~
Enter the number of background events:
~~~

