# get first arg
term=$1

assert () {
    E_PARAM_ERR=98
    if [ -z "$1" ]
    then
        echo "No argument passed to assert function. Exiting..."
        exit $E_PARAM_ERR
    fi
}

assert $term

# if arg is 0, run the first 3 models
# if arg is 1, run the last 3 models

if (term == "0")
then
    python tools/run_net.py --config-file ./projects/ngp/configs/ngp_chair.py
    python tools/run_net.py --config-file ./projects/ngp/configs/ngp_drums.py
    python tools/run_net.py --config-file ./projects/ngp/configs/ngp_ficus.py
    python test1.py
else
    python tools/run_net.py --config-file ./projects/ngp/configs/ngp_hotdog.py
    python tools/run_net.py --config-file ./projects/ngp/configs/ngp_lego.py
    python tools/run_net.py --config-file ./projects/ngp/configs/ngp_mic.py

    python test2.py
fi

