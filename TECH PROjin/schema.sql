CREATE TABLE countries (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    ranking INT,
    group_name VARCHAR(1)
);

CREATE TABLE players (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    country_id INT,
    uniform_num INT,
    position VARCHAR(2),
    name VARCHAR(50),
    club VARCHAR(50),
    birth date,
    height INT,
    weight INT,

    FOREIGN KEY (country_id) REFERENCES countries (id)
);

CREATE TABLE pairings (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    kickoff DATETIME,
    my_country_id INT,
    enemy_country_id INT,

    FOREIGN KEY (my_country_id) REFERENCES countries (id),
    FOREIGN KEY (enemy_country_id) REFERENCES countries (id)
);

CREATE TABLE goals (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    pairing_id INT,
    player_id INT,
    goal_time VARCHAR(10),

    FOREIGN KEY (pairing_id) REFERENCES pairings (id),
    FOREIGN KEY (player_id) REFERENCES players (id)
);