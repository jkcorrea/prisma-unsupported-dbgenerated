-- CreateTable
CREATE TABLE "table" (
    "id" TEXT NOT NULL,
    -- NOTE: Modified to make it a PG generated column
    "hereBeDragons" tsvector GENERATED ALWAYS AS (
        to_tsvector('english', id::text)
    ) STORED,

    CONSTRAINT "table_pkey" PRIMARY KEY ("id")
);
