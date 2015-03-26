FROM opensuse:latest

# sudo docker build -t opensuse/base .

RUN zypper --no-gpg-checks --non-interactive refresh
RUN zypper --no-gpg-checks --non-interactive update
RUN zypper --no-gpg-checks --non-interactive install less tar wget  
