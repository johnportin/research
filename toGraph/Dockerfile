FROM python:3

WORKDIR /host

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# VOLUME /host

CMD [ "python", "toGraphd4.py" ]