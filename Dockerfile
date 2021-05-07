FROM julia:buster

RUN apt update
RUN apt install -y --no-install-recommends build-essential m4 python3 python3-pip python3-setuptools git  

RUN pip3 install wheel
RUN pip3 install jupyterlab

RUN adduser --shell /bin/bash --gecos "" --disabled-password --home /home/oscar oscar
USER oscar
WORKDIR /home/oscar

RUN julia -e 'using Pkg; pkg" add Oscar; add IJulia; precompile "'

RUN mkdir -p ~/.julia/config
RUN echo 'println("Welcome! Type \"using Oscar\" to start...")' > ~/.julia/config/startup.jl

CMD julia
