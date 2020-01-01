FROM python:3

RUN mkdir /bandersnatch
ADD setup.cfg /bandersnatch
ADD setup.py /bandersnatch
ADD requirements.txt /bandersnatch
ADD README.md /bandersnatch
ADD CHANGES.md /bandersnatch
COPY src /bandersnatch/src

# OPTIONAL: Include a config file
# Remember to bind mount the "directory" in bandersnatch.conf
# Reccomended to bind mount /conf - `runner.py` defaults to look for /conf/bandersnatch.conf
# ADD bandersnatch.conf /etc

RUN pip install --upgrade pip setuptools wheel
RUN pip install --upgrade -r /bandersnatch/requirements.txt
RUN pip -v install /bandersnatch/

CMD ["python", "/src/src/runner.py", "3600"]
