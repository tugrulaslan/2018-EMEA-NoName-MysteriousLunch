CREATE TABLE "User" (
	"ID" serial NOT NULL,
	"Name" varchar(100) NOT NULL,
	"Surname" varchar(100) NOT NULL,
	"Bio" varchar(500),
	"Frequency" varchar(255),
	"Rating" integer,
	CONSTRAINT "User_pk" PRIMARY KEY ("ID")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Cuisine" (
	"ID" serial NOT NULL,
	"Definition" serial(255) NOT NULL,
	CONSTRAINT "Cuisine_pk" PRIMARY KEY ("ID")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Interest" (
	"ID" serial NOT NULL,
	"Definition" varchar(255) NOT NULL,
	CONSTRAINT "Interest_pk" PRIMARY KEY ("ID")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "User_Cuisine" (
	"User_id" integer NOT NULL,
	"Cuisine_id" integer NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "User_Interest" (
	"User_id" integer NOT NULL,
	"Interest_id" integer NOT NULL
) WITH (
  OIDS=FALSE
);






ALTER TABLE "User_Cuisine" ADD CONSTRAINT "User_Cuisine_fk0" FOREIGN KEY ("User_id") REFERENCES "User"("ID");
ALTER TABLE "User_Cuisine" ADD CONSTRAINT "User_Cuisine_fk1" FOREIGN KEY ("Cuisine_id") REFERENCES "Cuisine"("ID");

ALTER TABLE "User_Interest" ADD CONSTRAINT "User_Interest_fk0" FOREIGN KEY ("User_id") REFERENCES "User"("ID");
ALTER TABLE "User_Interest" ADD CONSTRAINT "User_Interest_fk1" FOREIGN KEY ("Interest_id") REFERENCES "Interest"("ID");

