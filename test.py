import pinecone
import os

pinecone.init(api_key=os.environ["PINECONE_API"], environment="gcp-starter")
pinecone.create_index("quickstart2", dimension=8, metric="euclidean")