-- CreateTable
CREATE TABLE "table" (
    "id" TEXT NOT NULL,

    -- manually edited migration to make column generated
    "hereBeDragons" TEXT NOT NULL GENERATED ALWAYS AS (
'this row ID is: '::text || "id") STORED,

    CONSTRAINT "table_pkey" PRIMARY KEY ("id")
);
