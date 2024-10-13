# ------------------- Stage 1: Build Stage ------------------------------
FROM python:3.7 AS builder

WORKDIR /app

COPY src/ .

RUN pip install --no-cache-dir -r requirements.txt

# ------------------- Stage 2: Final Stage ------------------------------

FROM python:3.7-slim

WORKDIR /app

# Copy dependencies and code from the builder stage
COPY --from=builder /usr/local/lib/python3.7/site-packages/ /usr/local/lib/python3.7/site-packages/

COPY --from=builder /app /app

# add group and user to run a container
RUN groupadd -r webservice && useradd --no-log-init -r -g webservice webservice

USER webservice:webservice

EXPOSE 8050

ENTRYPOINT ["python", "GraphAnalysis.py"]
CMD ["obj_dependency_data.csv"]
