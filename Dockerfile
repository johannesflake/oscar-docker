FROM julia:buster

RUN apt update
RUN apt install -y --no-install-recommends build-essential m4 python3 python3-dev python3-pip python3-setuptools git wget
RUN apt install -y libffi-dev

RUN pip3 install wheel
RUN pip3 install jupyterlab
RUN pip3 install sympy

RUN adduser --shell /bin/bash --gecos "" --disabled-password --home /home/oscar oscar
USER oscar
WORKDIR /home/oscar

RUN julia -e 'using Pkg; pkg" add Oscar; add IJulia; add SymPy; precompile "; using Oscar'

RUN mkdir -p ~/.julia/config
RUN echo 'println("Welcome! Type \"using Oscar\" to start...")' > ~/.julia/config/startup.jl

CMD julia
