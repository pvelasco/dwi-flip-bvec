#!/bin/bash
docker run --rm -it \
		-v /black/localhome/glerma/soft/dwi-flip-bvec/config.json:/flywheel/v0/config.json \
        -v /black/localhome/glerma/TESTDATA/flipbvec/input:/flywheel/v0/input \
        -v /black/localhome/glerma/TESTDATA/flipbvec/output:/flywheel/v0/output \
        scitran/dwi-flip-bvec:1.0.0
