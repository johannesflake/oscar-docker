FROM julia:buster

RUN apt update
RUN apt install -y --no-install-recommends build-essential

RUN apt install -y --no-install-recommends m4

RUN julia -e 'using Pkg; pkg"add Oscar"; precompile'

