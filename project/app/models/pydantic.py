# project/app/models/pydantic.py


from pydantic import BaseModel


class SummaryPayloadSchema(BaseModel):
    url: str