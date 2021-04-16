function weather {
    dest=${1:-Melbourne}
    curl v2.wttr.in/${dest}
}

function tunnel {
    port=$1
    dest=${2:-gavle}  # destination host
    ssh -N -f -L 127.0.0.1:${port}:127.0.0.1:${port} ${dest}
}

function killport {
    port=$1
    lsof -ti:${port} | xargs kill -9
}

function jupyterkernel {
        kernelname=$1
        conda activate $kernelname && python -m ipykernel install --user --name $kernelname --display-name "Python (${kernelname})"
}