#!/bin/bash
# module load matlab/2017a

cat > build.m <<END


mcc -m dwiflipbvec.m

exit
END
Matlabr2017a -nodisplay -nosplash -r build && rm build.m
