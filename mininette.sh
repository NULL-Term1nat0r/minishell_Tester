#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'
#echo "Hello World" | ./minishell >> ./mininette/output.txt

echo ""
echo ""
echo "        *&%%%%&%%%%#               .,******,..              .&%%%&%&%%%&"
echo "     .%&%%%%%%%%%%%%%%/   ,*,***.               .,*,**.   %&%%%%%%%%%%%%%%&"
echo "    %%%%%%((((((((#%%(***.                             .***#%%(((((((((%%%&%,"
echo "   /%%%%(((((((#((***                                      .,**(((((((((#%%%%"
echo "   (%%%%((((((#*,,                                             ,,/((((((#%%%%."
echo "    &%%%%((((**.               MININETTE-TESTER                  ,**(((#%%%&%"
echo "     &%%%%%**                                                      ,,/%%%%%("
echo "       #%/,.                                                         **#&*"
echo "        **                                                            .,,"
echo "       *,         /#%%%%%*                            .(%%%%%#,         **"
echo "      **      (%%%%%%%%%%%%%%                      ,&%%%%%%%%%%%%%,      **"
echo "     ,*     %%%%%%%%%%%%%%%%%%(                   %%%%%%%%%%%%%%%%%%(     ,,"
echo "    ,*    #%%%%%%%%%%.    %%%%%(                 %%%%%*    *%%%%%%%%%%.   ,,"
echo "    *,   #%%%%%%%%%#       %%%%%                .%%%%,       %%%%%%%%%%,   **"
echo "   .*   /%%%%%%%%%%(       %%%%%                *%%%%%       %%%%%%%%%%%   ,*"
echo "   **   &%%%%%%%%%%%%.  .#%%%%%#                 %%%%%%(   /%%%%%%%%%%%%/   *."
echo "   *,   %%%%%%%%%%%%%%%%%%%%%%%                  /%%%%%%%%%%%%%%%%%%%%%%(   *."
echo "   **   (%%%%%%%%%%%%%%%%%%%%%                    *%%%%%%%%%%%%%%%%%%%%%.   *."
echo "   ,*    %%%%%%%%%%%%%%%%%%%#     (%%%%%%%%%%%.     &%%%%%%%%%%%%%%%%%%*   ,*"
echo "    *,    *%%%%%%%%%%%%%%%/        ,@&@@@@&&%         %%%%%%%%%%%%%%%%     **"
echo "    ,*       (%%%%%%%%#,               %%#               /%%%%%%%%%*      ,*"
echo "     **. . . . . . . . . . . .%#,...(%%%%%%%(,,*#%(. . . . . . . . . . . .*."
echo "      ,,.........................(%%%%%%%%%%%%%. .......................,*"
echo "        **........................#%%/*/////%%*........................**"
echo "         .**,.......................*//////*,........................**"
echo "            ,**,.....................,...........................,**."
echo "               ,**,,.........................................,***"
echo "                    ,*,*,,...,.,.................,....,,*,**,"
echo "                            ,,*********************,,"


program_name=$1

if [ ! -e ./mininette/testcases.txt ]; then
  echo "testcase file non-existing"
  exit 0
fi
# delete file if there is an existing one, so the while loop gets the right values
if [ -e ./mininette/output.txt ]; then
  rm -f ./mininette/output.txt
fi

line_count=$(wc -l ./mininette/testcases.txt | awk '{print $1}')
line_count_int=$(expr "$line_count" + 0)+1

count=1
((line_count_int += count))
while [ $count -lt $line_count_int ]
do
    testcase=$(sed -n "${count}p" ./mininette/testcases.txt)
#    output_minishell=$(echo "${testcase}" | ./${program_name})
    output_minishell=$(echo "${testcase}" | ./${program_name})
#    echo "${testcase}" | ./${program_name} >> ./mininette/output.txt
#    echo "${testcase}" | ./${program_name} >> output_minishell
#    output_minishell=$(sed -n "${count}p" ./mininette/output.txt)
    cmd="${testcase}"
    output_bash=$(eval "$cmd" 2>&1 | sed 's/mininette.sh: line [0-9]*: //')
#    error_message=$(eval "$cmd")


    string="${output_minishell}"
    search="${output_bash}"

 if echo "${output_minnishell}" | perl -0777 -ne 'print if /$ENV{search}/' > /dev/null; then
     echo -e "${GREEN}test$count OK${NC}"
 else
     echo -e "${RED}test$count KO${NC}"
     echo "testcase: ${testcase}"
     echo "miniShell output -> ${output_minishell}"
     echo "bash      output -> ${output_bash}"
 fi




#if [ "${output_minishell}" = "${output_bash}" ]
#    then
#      echo -e "${GREEN}test$count OK${NC}"
#    else
#      echo -e "${RED}test$count KO${NC}"
#      echo "testcase: ${testcase}"
#      echo "miniShell output -> ${output_minishell}"
#      echo "bash      output -> ${output_bash}"
##      if [ "${output_bash}" != "" ]
##      then
##        echo "expected  output-> ${output_bash}"
##      else
##        echo "expected  output-> ${error_message}"
##      fi
#    fi
    ((count++))
done
