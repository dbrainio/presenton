from datetime import datetime
from typing import Optional
import uuid

from sqlalchemy import JSON, Column, DateTime
from sqlmodel import Field, SQLModel

from utils.datetime_utils import get_current_utc_datetime


class ImageAsset(SQLModel, table=True):
    id: uuid.UUID = Field(default_factory=uuid.uuid4, primary_key=True)
    created_at: datetime = Field(
        sa_column=Column(
            DateTime(timezone=True), nullable=False, default=get_current_utc_datetime
        ),
    )
    # Indicates whether the image has been uploaded to object storage (S3/MinIO)
    is_uploaded: bool = Field(default=False)
    path: str
    s3_url: Optional[str] = None
    extras: Optional[dict] = Field(sa_column=Column(JSON), default=None)
