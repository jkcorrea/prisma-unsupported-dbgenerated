# Prisma Postgres Unsupported/dbgenerated() bug

Prisma v4.4 [still wants to drop column defaults](https://github.com/prisma/prisma/issues/14799) for `Unsupported` columns using `dbgenerated()`.

Reference GH issue: https://github.com/prisma/prisma/issues/14799

## Repro instructions

1. Update `.env` with a new db
2. `yarn install`
3. `yarn prisma migrate dev`
4. Notice the new migration it tries to create & run:

```sql
-- AlterTable
ALTER TABLE "table" ALTER COLUMN "hereBeDragons" DROP DEFAULT;
```
