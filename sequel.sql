CREATE TABLE "songs" (
	-- Define my columns
	"id" SERIAL PRIMARY KEY, -- the main identifier of these columns
	"artist" VARCHAR(255), -- a string or "varying character"
	"track" VARCHAR(255),
	"rank" INTEGER,
	"datePublished" DATE
);

DROP TABLE "songs";

-- add an item to our table
INSERT INTO "songs"
	("artist", "track", "rank", "datePublished")
VALUES
	('Neil Young', 'Heart of Gold', 9, '1-1-1972'),
	('Oasis', 'Wonderwall', 23, '1-1-1996');
	
-- see the items in the table
SELECT * FROM "songs";
	-- ^ wild card (everything)
	
SELECT "track", "artist" FROM "songs";
 	-- same data, but will only see those two columns

-- top 10 tracks by rank
SELECT * FROM "songs"
ORDER BY "rank" ASC -- short cut for ascending (DESC for descending)
LIMIT 10;

-- find all songs by Elvis Presley
SELECT * FROM "songs"
WHERE "artist" = 'Elvis Presley';

-- find all songs from the 90s and later
SELECT * FROM "songs"
WHERE "datePublished" >= '1990-01-01';

-- find all songs from the 90s to 2000s
SELECT * FROM "songs"
WHERE "datePublished" >= '1990-01-01'
AND "datePublished" < '2000-01-01';

-- find top 5 songs from the 90s
SELECT * FROM "songs"
WHERE "datePublished" >= '1990-01-01'
AND "datePublished" < '2000-01-01'
ORDER BY "rank" ASC
LIMIT 5;

-- make a "Love and Joy" playlist
SELECT * FROM "songs"
WHERE (
	"track" LIKE '%Love%'
	OR "track" LIKE '%Joy%'
)
AND "datePublished" < '1975-01-01';

-- find a specific track
SELECT * FROM "songs"
WHERE "id" = 43;

-- Order of operators:
--
-- SELECT
-- FROM
-- WHERE
-- ORDER
-- LIMIT
--

-- Neil Young --> Neil Old
UPDATE "songs"
SET "artist" = 'Neil Old'
WHERE "artist" = 'Neil Young';

SELECT * FROM "songs"
WHERE "artist" = 'Neil Old';

-- bump the rank of heart of gold
UPDATE "songs"
SET "rank" = 8
		  -- ^ could also be "rank" - 1 to decrement
WHERE "id" = 2;

-- delete that duplicate track
-- with id = 25
DELETE FROM "songs"
WHERE "id" = 26;

SELECT * FROM "songs";

DELETE FROM "songs"
WHERE "id" IN (15, 20, 35); -- match multiple parameters

-- Basic command:
--
-- SELECT
-- INSERT
-- UPDATE
-- DELETE
--
-- CREATE TABLE
-- DROP TABLE
-- and maybe ALTAR TABLE

-- CAN ALSO
-- do do psql -d database_name
-- from terminal to access the same thing
