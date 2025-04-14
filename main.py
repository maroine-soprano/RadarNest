# main.py

from fastapi import FastAPI
from pydantic import BaseModel
from llama_cpp import Llama

MODEL_PATH = "./models/mistral-7b-instruct-v0.2.Q4_K_M.gguf"

app = FastAPI()


class SessionData(BaseModel):
    device: str
    deviceBrand: str
    deviceModel: str
    country: str
    temperature: str
    adsPlatform: str


def build_prompt(data: SessionData) -> str:
    return f"""Q:You are a marketing strategist. Based on this user session data:

- device: {data.device}
- device brand: {data.deviceBrand}
- device model: {data.deviceModel}
- country: {data.country}
- temperature: {data.temperature}°C
- ads platform : {data.adsPlatform}

 List top 3 best marketing strategy ?"""


def run_llama(prompt: str) -> str:
    llm = Llama(
        model_path=MODEL_PATH
    )
    output = llm(
        prompt,
        max_tokens=190,
        echo=False
    )

    try:
        return output
    except (IndexError, AttributeError):
        return "Error: Unable to retrieve text from output."


@app.post("/generate-strategy")
def generate_strategy(data: SessionData):
    prompt = build_prompt(data)
    result = run_llama(prompt)
    return {"strategy": result}
