# Prisma Postgres @default(dbgenerated()) bug reproduction

`schema.prisma`:

```
model table {
    id String @id
    hereBeDragons String @default(dbgenerated())
}
```

..with custom migration to use Postgres generated field:

`migrations/20220814081320_init/migration.sql`:

```
CREATE TABLE "table" (
    ...

    -- manually edited migration to make column generated
    "hereBeDragons" TEXT NOT NULL GENERATED ALWAYS AS (
'this row ID is: '::text || "id") STORED,

    ...
```

Worked just fine through prisma 3.15.2; prisma 4.0.0 onwards produces invalid migration with no schema change
that attempts to DROP DEFAULT (which we don't want to do, and fails since Postgres generated columns require
use of DROP EXPRESSION if we were actually to want to convert the generated column to a normal one).

Prisma 4.0.0+ attempt to generate new unwanted + invalid migration with no schema change:

`migrations/20220814083015_fail/migration.sql`:

```
ALTER TABLE "table" ALTER COLUMN "hereBeDragons" DROP DEFAULT;
```

**Expected behaviour:** Prisma 4 continues to support this schema and migration history with no attempt
to generate a new migration dropping the default value for the column.
