-- Table: users
CREATE TABLE users (
  id       INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  firstname VARCHAR(255) NOT NULL,
  lastname VARCHAR(255) NOT NULL
)
  ENGINE = InnoDB;

-- Table: roles
CREATE TABLE roles (
  id   INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL
)
  ENGINE = InnoDB;

-- Table for mapping user and roles: user_roles
CREATE TABLE user_roles (
  user_id INT NOT NULL,
  role_id INT NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users (id),
  FOREIGN KEY (role_id) REFERENCES roles (id),

  UNIQUE (user_id, role_id)
)
  ENGINE = InnoDB;

-- Table: manufacturers
CREATE TABLE manufacturers (
  id       INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nameMan VARCHAR(255) NOT NULL

) ENGINE = InnoDB;

-- Table: products
CREATE TABLE products (
  id       INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  price DECIMAL NOT NULL,
  manufacturer_id INT NOT NULL,

  FOREIGN KEY (manufacturer_id) REFERENCES manufacturers (id)

) ENGINE = InnoDB;

-- Insert data                              password 12345678

INSERT INTO users VALUES (1, 'roleadmin1', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG','admin@email.com','Admin','Admin');
INSERT INTO users VALUES (2, 'roleadmin2', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG','admin2@email.com','Admin','Admin');
INSERT INTO users VALUES (3, 'roleuser1', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG','useruser@email.com','User','User');

INSERT INTO roles VALUES (1, 'ROLE_USER');
INSERT INTO roles VALUES (2, 'ROLE_ADMIN');

INSERT INTO user_roles VALUES (1, 2);
INSERT INTO user_roles VALUES (2, 2);
INSERT INTO user_roles VALUES (3, 1);

INSERT INTO manufacturers VALUE (1, 'Atari');
INSERT INTO manufacturers VALUE (2, 'Activision');
INSERT INTO manufacturers VALUE (3, 'Evryware');
INSERT INTO manufacturers VALUE (4, 'Ariolasoft');

INSERT INTO products VALUE (1, 'value1', 20, 1);
INSERT INTO products VALUE (2, 'value2', 30, 2);
INSERT INTO products VALUE (3, 'value3', 40, 3);
INSERT INTO products VALUE (4, 'value4', 50, 4);