FROM python:3.11-slim
RUN apt update
RUN apt install -y nodejs ffmpeg

WORKDIR /code

COPY ./requirements.txt ./
RUN pip install --no-cache-dir --upgrade -r ./requirements.txt

CMD ["jupyter-lab", "--ip=0.0.0.0", "--port=8889", "--allow-root", "--no-browser"]