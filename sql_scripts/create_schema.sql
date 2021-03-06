create hdfsstore sta_datastore
namenode 'hdfs://<hostname>:8020'
homedir '/sta_tables'
batchsize 10
queuepersistent true
batchtimeinterval 120000;

CREATE TABLE Booking (id bigint not null, beds int not null, checkinDate date not null, checkoutDate date not null, creditCard varchar(255) not null, creditCardExpiryMonth int not null, creditCardExpiryYear int not null, creditCardName varchar(255) not null, smoking smallint, hotel_id bigint, user_username varchar(255), primary key (id))
PARTITION BY PRIMARY KEY 
EVICTION BY CRITERIA (ID > 1000 )
EVICTION FREQUENCY 180 SECONDS
PERSISTENT 
HDFSSTORE (STA_DATASTORE);

create table Customer (username varchar(255) not null, name varchar(255), password varchar(255), primary key (username)) persistent;

create table Hotel (id bigint generated by default as identity (start with 1), address varchar(255), city varchar(255), country varchar(255), name varchar(255), price numeric(6,2), state varchar(255), zip varchar(255), primary key (id)) persistent;

create table hibernate_sequences (sequence_name varchar(255), sequence_next_hi_value integer);

