CREATE TABLE Theme (
  id CHAR(36) PRIMARY KEY,
  name VARCHAR(255),
  description TEXT,
  coordinator_id CHAR(36),
  webpage TEXT,
  FOREIGN KEY (coordinator_id) REFERENCES Person(id)
);

CREATE TABLE Person (
  id CHAR(36) PRIMARY KEY,
  name VARCHAR(255),
  birth_date DATE,
  rg VARCHAR(20),
  cpf VARCHAR(11),
  profession VARCHAR(100),
  pis_pasep VARCHAR(20),
  company VARCHAR(255)
);

CREATE TABLE Committee (
  id CHAR(36) PRIMARY KEY,
  theme_id CHAR(36),
  person_id CHAR(36),
  FOREIGN KEY (theme_id) REFERENCES Theme(id),
  FOREIGN KEY (person_id) REFERENCES Person(id)
);

CREATE TABLE Project (
  id CHAR(36) PRIMARY KEY,
  title VARCHAR(255),
  coordinator_id CHAR(36),
  budget DOUBLE,
  theme_id CHAR(36),
  start_date DATE,
  expected_end_date DATE,
  status VARCHAR(50),
  FOREIGN KEY (coordinator_id) REFERENCES Person(id),
  FOREIGN KEY (theme_id) REFERENCES Theme(id)
);

CREATE TABLE ProjectParticipation (
  id CHAR(36) PRIMARY KEY,
  project_id CHAR(36),
  person_id CHAR(36),
  role VARCHAR(50),
  hours_dedicated DOUBLE,
  FOREIGN KEY (project_id) REFERENCES Project(id),
  FOREIGN KEY (person_id) REFERENCES Person(id)
);

CREATE TABLE Space (
  id CHAR(36) PRIMARY KEY,
  name VARCHAR(255),
  address TEXT,
  type VARCHAR(50),
  items TEXT,
  phone VARCHAR(20),
  capacity INT,
  operating_hours TEXT,
  site TEXT
);

CREATE TABLE ProjectProposal (
  id CHAR(36) PRIMARY KEY,
  project_id CHAR(36),
  general_proposal TEXT,
  detailed_description TEXT,
  FOREIGN KEY (project_id) REFERENCES Project(id)
);

CREATE TABLE ProjectResult (
  id CHAR(36) PRIMARY KEY,
  project_id CHAR(36),
  result_type VARCHAR(50),
  title VARCHAR(255),
  summary TEXT,
  keywords TEXT,
  publication_date DATE,
  review_date DATE,
  authors TEXT,
  body TEXT,
  reference_list TEXT,
  website TEXT,
  publication_place TEXT,
  awards TEXT,
  indexing_numbers TEXT,
  citation_index TEXT,
  cited_works TEXT,
  FOREIGN KEY (project_id) REFERENCES Project(id)
);

CREATE TABLE Document (
  id CHAR(36) PRIMARY KEY,
  title VARCHAR(255),
  summary TEXT,
  keywords TEXT,
  publication_date DATE,
  review_date DATE,
  authors TEXT,
  body TEXT,
  reference_list TEXT,
  website TEXT,
  publication_place TEXT,
  awards TEXT,
  indexing_numbers TEXT,
  citation_index TEXT,
  cited_works TEXT
);
