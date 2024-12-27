FROM ajalilian/django-alpine-base:5.1.4
LABEL authors="ajalilian"
LABEL version="5.1.4"

USER root

RUN apk add \
    gobject-introspection-dev \
    cairo-dev \
    pango-dev \
    gdk-pixbuf-dev \
    libffi-dev \
    shared-mime-info \
    ttf-dejavu

RUN mkdir -p /var/cache/fontconfig && \
    chmod 777 /var/cache/fontconfig

COPY ./requirements /requirements
COPY ./scripts /scripts
COPY ./src /src

WORKDIR /src

EXPOSE 8003

RUN /py/bin/pip install -r /requirements/development.txt

RUN chmod -R +x /scripts && \
    chown -R django-user:django-user /scripts /src

ENV PATH="/scripts:/py/bin:$PATH"

USER django-user

CMD ["run.sh"]