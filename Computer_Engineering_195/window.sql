-- 1. drop the database window if it exists
-- 2. create the database window
-- 3. set the current DB context to the newly created database, and then execute the DDL statements.

-- drop database if exists window;
create database window;
use window;

CREATE TABLE shopping_cart (
  window_ID           integer not null,

  width               varchar(20) not null,
  height              varchar(20) not null,

  label               varchar(50) not null,

  window_type         varchar(15) not null,
  casement_side_type  varchar(10) not null,
  slider_type         varchar(2) not null,
  glass_type          varchar(20) not null,
  gas_type            varchar(20) not null,
  tempered_type       varchar(20) not null,
  frame_type          varchar(20) not null,
    
  quantity            integer not null,

  primary key (window_ID),
  CONSTRAINT CK_window_type CHECK (window_type IN ('Single Hung', 'Double Hung', 'Casement', 'Awning')),
  CONSTRAINT CK_casement_side_type CHECK (casement_side_type IN ('N/A', 'Right', 'Left')),
  CONSTRAINT CK_slider_type CHECK (slider_type IN ('XO', 'OX')),
  CONSTRAINT CK_glass_type CHECK (glass_type IN ('N/A', 'Low-E 270', 'Low-E 360', 'Obscured')),
  CONSTRAINT CK_gas_type CHECK (gas_type IN ('N/A', 'Yes', 'No')),
  CONSTRAINT CK_tempered_type CHECK (tempered_type IN ('N/A', 'Tempered', 'No Tempered')),
  CONSTRAINT CK_frame_type CHECK (frame_type IN ('N/A', 'Block', 'Nail Fin', 'Stucco'))
);

CREATE TABLE recent_quotes (
	quote_ID			integer not null,
	price				money not null,
	window_ID           integer not null,

	width               integer not null,
	height              integer not null,

	label               varchar(50) not null,

	window_type         varchar(15) not null,
	casement_side_type  varchar(10) not null,
	slider_type         varchar(2) not null,
	glass_type          varchar(20) not null,
	gas_type            varchar(20) not null,
	tempered_type       varchar(20) not null,
	frame_type          varchar(20) not null,

	quantity            integer not null
);

