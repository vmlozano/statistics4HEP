#!/bin/bash
echo ""
echo " *******************************************************************"
echo " *       _______ __         __   __       __   __                  *" 
echo " *      |       |  |_.---.-|  |_|__.-----|  |_|__.----.-----.      *"
echo " *      |   |___|   _|  _  |   _|  |__ --|   _|  |  __|__ --|      *"
echo " *      |____   |____|___._|____|__|_____|____|__|____|_____|      *"
echo " *      |   |   |                                                  *"
echo " *      |_______|                                                  *"
echo " *                 ___ ___ ___ ___ _______ _______                 *"
echo " *                |   Y   |   Y   |    ___|   _   |                *"
echo " *                |   |   |   |   |   |_  |  |_|  |                *"
echo " *                |____   |   _   |    _| |   ____|                *"
echo " *                    |   |   |   |   |___|   |                    *"
echo " *                    |___|___|___|_______|___|                    *"
echo " *                                                                 *"
echo " *                                                                 *"
echo " *          VERSION 1.1                        XX-03-2021          *"
echo " *                                                                 *"
echo " *                Developed by Víctor Martín Lozano                *"
echo " *                                                                 *"
echo " *                       Find more info at:                        *"
echo " *            https://github.com/vmlozano/statistics4HEP           *"
echo " *                                                                 *"
echo " *    Comments, suggestions, etc at victor.lozano [at] desy.de     *"
echo " *                                                                 *"
echo " *******************************************************************"

### Exclusion significance w/o uncertainties function:

significanceexc(){
   sumsb=$(echo "scale=4; $1+$2" | bc -l)
   sqrtb=$(echo "scale=4; sqrt($sumsb)" | bc -l)
   teste=$(echo "scale=4; $2*l($2/$sumsb)+$1" | bc -l)
   sexcexa=$(echo "scale=4; sqrt(2*$teste)" | bc -l)
   sexcapp=$(echo "scale=4; $1/$sqrtb" | bc -l)
   conv=$(echo "scale=4; 1+$sexcexa/1.645" | bc -l)
   DECIMAL=$conv
   numero=${DECIMAL%.*}
   #if [ "$numero" -eq 4 ];

   echo " *Exclusion significance*"
   echo ""
   echo " The approximated exclusion significance is: $sexcapp"
   echo " The exact exclusion significance is: $sexcexa"
   #echo " La división es $conv"
   if [ "$numero" -ge 2 ];
   then
        echo " The result is EXCLUDED"
   else
        echo " The result is ALLOWED"
   fi
   echo ""
   #return $sqrtb
}

### Discovery significance w/o uncertainties function:

significancedis(){
   sumsb=$(echo "scale=4; $1+$2" | bc -l)
   sqrtb=$(echo "scale=4; sqrt($2)" | bc -l)
   testd=$(echo "scale=4; $sumsb*l($sumsb/$2)-$1" | bc -l)
   sdisexa=$(echo "scale=4; sqrt(2*$testd)" | bc -l)
   sdisapp=$(echo "scale=4; $1/$sqrtb" | bc -l)
   echo " *Discovery significance*"
   echo "   "
   echo " The approximated discovery significance is: $sdisapp"
   echo " The exact discovery significance is: $sdisexa"
   echo ""

}

### Exclusion significance w uncertainties function:

significanceexcunc(){
   sumsb=$(echo "scale=6; $1+$2" | bc -l)
   sumbsig=$(echo "scale=6; $2+$3*$3" | bc -l)
   sqrtbsig=$(echo "scale=6; sqrt($sumbsig)" | bc -l)
   sexcapp=$(echo "scale=6; $1/$sqrtbsig" | bc -l)
   echo " *Exclusion significance*"
   echo ""
   echo " The approximated exclusion significance is: $sexcapp"
#   echo " The exact exclusion significance is: $sexcexa"
   echo ""
   #Include the excluded if
}

### Discovery significance w uncertainties function:

significancedisunc(){
   sumsb=$(echo "scale=6; $1+$2" | bc -l)
   sumbsig=$(echo "scale=6; $2+$3*$3" | bc -l)
   numa=$(echo "scale=6; $sumsb*$sumbsig" | bc -l)
   dena=$(echo "scale=6; $2*$2+$3*$3*$sumsb" | bc -l)
   fterm=$(echo "scale=6; $sumsb*l($numa/$dena)" | bc -l)
   boversigma=$(echo "scale=6; $2/$3" | bc -l)
   numb=$(echo "scale=6; $1*$3*$3" | bc -l)
   denb=$(echo "scale=6; $2*$sumbsig" | bc -l)
   sterm=$(echo "scale=6; $boversigma*$boversigma*l(1+$numb/$denb)" | bc -l)
   sdisexa=$(echo "scale=4; sqrt(2*($fterm - $sterm))" | bc -l)
   sqrtbsig=$(echo "scale=6; sqrt($sumbsig)" | bc -l)
   sdisapp=$(echo "scale=6; $1/$sqrtbsig" | bc -l)
   echo " *Discovery significance*"
   echo "   "
   echo " The approximated discovery significance is: $sdisapp"
   echo " The exact discovery significance is: $sdisexa"
   echo ""
}

### Calling the significance w/o uncertainties functions

callwounc(){
echo ""
read -p " Enter the number of signal events: " int1
  if  [ "$int1" = "" ]; then
  echo " Please, enter a number."
  read -p " Enter the number of signal events: " int1
    if [ "$int1" = "" ]; then
    exit
    fi
  fi
echo ""
read -p " Enter the number of background events: " int2
  if [ "$int2" = "" ]; then
  echo " Please, enter a number."
  read -p " Enter the number of background events: " int2
    if [ "$int2" = "" ]; then
    exit
    fi
  fi
echo ""
echo " ***RESULTS***"
echo ""
significanceexc $int1 $int2
significancedis $int1 $int2
}

### Calling the significance w uncertainties functions

callwunc(){
echo ""
read -p " Enter the number of signal events: " int1
  if  [ "$int1" = "" ]; then
  echo " Please, enter a number."
  read -p " Enter the number of signal events: " int1
    if [ "$int1" = "" ]; then
    exit
    fi
  fi
echo ""
read -p " Enter the number of background events: " int2
  if [ "$int2" = "" ]; then
  echo " Please, enter a number."
  read -p " Enter the number of background events: " int2
    if [ "$int2" = "" ]; then
    exit
    fi
  fi
echo ""
read -p " Enter the value of the uncertainty: " int3
  if [ "$int3" = "" ]; then
  echo " Please, enter a number."
  read -p " Enter the value of the uncertainty: " int3
    if [ "$int3" = "" ]; then
    exit
    fi
  fi
echo ""
echo " ***RESULTS***"
echo ""
significanceexcunc $int1 $int2 $int3
significancedisunc $int1 $int2 $int3
}

callc3p0(){
echo ""
echo "  _____________________________ "
echo " |                             |"
echo " | R2-D2, you know better than |"
echo " | to trust a strange computer.|"
echo " \____________________  _______/"
echo "                      \|        "
echo "                        /~\     "
echo "                       ( oo|    "
echo "                       _\=/_    "
echo "        ___        #  /  _  \   "
echo "       / ()\       \ //|/·\| \  "
echo "     _|_____|_      \/  \_/  || "
echo "    | | === | |        |\ /| || "
echo "    |_|  O  |_|        \_ _/  # "
echo "     ||  O  ||         | | |    "
echo "     ||__*__||         | | |    "
echo "    |~ \___/ ~|        []|[]    "
echo "    /=\ /=\ /=\        | | |    "
echo "____[_]_[_]_[_]_______/_]_[_\_______ "
echo ""
}

echo ""
echo " Select an option"
echo ""
echo " 1: Significance without uncertainties."
echo " 2: Significance with uncertainties."
read VAR   
case "$VAR" in
1) callwounc;;
2) callwunc;;
14) callc3p0;;
*) echo " Entry not supported."  
exit;;
esac

