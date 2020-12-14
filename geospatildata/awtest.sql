-- SCHEMA: tiger

-- DROP SCHEMA tiger ;


CREATE SCHEMA IF NOT EXISTS awtest
    AUTHORIZATION postgres;
	
CREATE TABLE IF NOT EXISTS awtest.myarea (
  id SERIAL PRIMARY KEY,
  address text COLLATE pg_catalog."default" NOT NULL,
  geo geography NOT NULL
)

TABLESPACE pg_default;

ALTER TABLE awtest.myarea
    OWNER to postgres;
	

	
INSERT INTO awtest.myarea(address, geo) VALUES('2 Binnery Drive', ST_GeomFromText('POINT(-79.74097636080022 43.779062426631825)', 4326));
INSERT INTO awtest.myarea(address, geo) VALUES('4 Binnery Drive', ST_GeomFromText('POINT(-79.74079049320125 43.77917745410056)', 4326));
INSERT INTO awtest.myarea(address, geo) VALUES('6 Binnery Drive', ST_GeomFromText('POINT(-79.74061790185935 43.779277418268684)', 4326));
INSERT INTO awtest.myarea(address, geo) VALUES('8 Binnery Drive', ST_GeomFromText('POINT(-79.74040737835438 43.779332193084436)', 4326));
INSERT INTO awtest.myarea(address, geo) VALUES('10 Binnery Drive', ST_GeomFromText('POINT(-79.74016081929452 43.779347256149954)', 4326));

INSERT INTO awtest.myarea(address, geo) VALUES('1 Binnery Drive', ST_GeomFromText('POINT( -79.74059514255512 43.77884058731898)', 4326));
INSERT INTO awtest.myarea(address, geo) VALUES('3 Binnery Drive', ST_GeomFromText('POINT(-79.74036754957677 43.77893233577734)', 4326));
INSERT INTO awtest.myarea(address, geo) VALUES('5 Binnery Drive', ST_GeomFromText('POINT(-79.74017030232889 43.77898984966451)', 4326));
INSERT INTO awtest.myarea(address, geo) VALUES('7 Binnery Drive', ST_GeomFromText('POINT(-79.74000909063591 43.77899738124088)', 4326));
INSERT INTO awtest.myarea(address, geo) VALUES('9 Binnery Drive', ST_GeomFromText('POINT(-79.73985072385516 43.77899395779721)', 4326));


INSERT INTO awtest.myarea(address, geo) VALUES('36 Whitewell Drive', ST_GeomFromText('POINT(-79.74049095143779 43.778749058880685)', 4326));
INSERT INTO awtest.myarea(address, geo) VALUES('37 Whitewell Drive', ST_GeomFromText('POINT(-79.74156508359364 43.77895229993565)', 4326));
INSERT INTO awtest.myarea(address, geo) VALUES('39 Whitewell Drive', ST_GeomFromText('POINT(-79.74145344402388 43.778873997514154)', 4326));
INSERT INTO awtest.myarea(address, geo) VALUES('41 Whitewell Drive', ST_GeomFromText('POINT(-79.74130512288117 43.778772664816486)', 4326));
INSERT INTO awtest.myarea(address, geo) VALUES('43 Whitewell Drive', ST_GeomFromText('POINT(-79.74117115539744 43.778703574242336)', 4326));
INSERT INTO awtest.myarea(address, geo) VALUES('45 Whitewell Drive', ST_GeomFromText('POINT(-79.7410866282946 43.77860108974367)', 4326));
INSERT INTO awtest.myarea(address, geo) VALUES('47 Whitewell Drive', ST_GeomFromText('POINT(-79.74099731664911 43.7785262414041 )', 4326));
INSERT INTO awtest.myarea(address, geo) VALUES('33 Whitewell Drive', ST_GeomFromText('POINT(-79.74206746167194 43.77933690152451)', 4326));
INSERT INTO awtest.myarea(address, geo) VALUES('31 Whitewell Drive', ST_GeomFromText('POINT(-79.74219345490067 43.77943017279277)', 4326));

SELECT id, address, geo
	FROM awtest.myarea;
	
SELECT address,	ST_Distance(  geo,   ST_GeomFromText('POINT(-79.74097636080022 43.779062426631825)', 4326)) as "dist" from  awtest.myarea ;


SELECT address, geo, dist 
FROM
(
 SELECT address,geo,	ST_Distance(  geo,   ST_GeomFromText('POINT(-79.74097636080022 43.779062426631825)', 4326)) as "dist" from  awtest.myarea
) as nested
where dist > 60 ;




---- Creating log table

CREATE TABLE awtest.logtable
(
    id serial NOT NULL PRIMARY KEY,
	userid integer not null,
	logdata json NOT NULL,
	"timestamp" timestamp with time zone NOT NULL,
)

TABLESPACE pg_default;

ALTER TABLE awtest.logtable
    OWNER to postgres;


INSERT INTO awtest.logtable(userid, logdata, timestamp) VALUES(13,'{"name":"john","age":23}', current_timestamp);

select * from awtest.logtable;





