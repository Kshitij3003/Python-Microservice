from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def health_check():
    return {"status": "OK"}

@app.get("/hello/{name}")
def say_hello(name: str):
    return {"message": f"Hello, {name}!"}
