# use thomasfraunholz/docker-cuda-poetry as base image with tag 1.6.1+117 this means poetry verion 1.6.1 and cuda version 11.7.X
FROM thomasfraunholz/docker-cuda-poetry:1.6.1-117

RUN pip install jupyter
COPY scripts/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
# Use EXPOSE to instruct the image to expose ports as needed
EXPOSE 8888

# The main purpose of a CMD is to provide defaults for an executing container
# This CMD opens the jupyter notebook when you run the image
CMD ["bash", "-c", "source /etc/bash.bashrc && jupyter notebook --ip 0.0.0.0 --no-browser --allow-root"]
