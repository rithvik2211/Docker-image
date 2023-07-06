FROM ubuntu:latest

RUN apt-get update && apt-get install -y python3 python3-pip
RUN pip install selenium
RUN pip install pandas

RUN mkdir app
WORKDIR /app
COPY test.py /app/
# COPY C:\Users\sanda\Desktop\AWS-lambda\docker_dev\msedgedriver /app/
COPY browser_test.py /app/

RUN apt update
RUN apt install sudo
RUN sudo apt-get update

########################################################
# RUN echo "y" | sudo apt-get install curl
# RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
# RUN sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
# RUN sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge-dev.list'
# RUN sudo rm microsoft.gpg
# RUN sudo apt install microsoft-edge-stable
########################################################

RUN echo "y" | sudo apt install software-properties-common apt-transport-https wget
RUN wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
RUN sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main"
RUN echo "y" | sudo apt install microsoft-edge-stable

# CMD ["python3", "browser_test.py",  "test.py"]

CMD ["python3", "browser_test.py"]
