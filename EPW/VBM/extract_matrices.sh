#!/bin/bash

# Create directories
mkdir -p 8_to_8 8_to_9 9_to_8 9_to_9

# Loop through values from 1 to 9
for i in {1..9}
do
	    # Step 1: 6 to 6
	        grep "8        8        $i" epw1.out > 8_to_8/epwdata$i
		    cut -c 57-92 8_to_8/epwdata$i > 8_to_8/EPW_$i.txt

		        # Step 2: 6 to 7
			    grep "8        9        $i" epw1.out > 8_to_9/epwdata$i
			        cut -c 57-92 8_to_9/epwdata$i > 8_to_9/EPW_$i.txt

				    # Step 3: 7 to 6
				        grep "9        8        $i" epw1.out > 9_to_8/epwdata$i
					    cut -c 57-92 9_to_8/epwdata$i > 9_to_8/EPW_$i.txt

					        # Step 4: 7 to 7
						    grep "9        9        $i" epw1.out > 9_to_9/epwdata$i
						        cut -c 57-92 9_to_9/epwdata$i > 9_to_9/EPW_$i.txt

						done

						echo "Process completed."

