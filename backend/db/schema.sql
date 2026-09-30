-- Controle Financeiro Pessoal — modelo do banco (MySQL 8+)

CREATE DATABASE IF NOT EXISTS controle_financeiro
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE controle_financeiro;

CREATE TABLE users (
  id            INT AUTO_INCREMENT PRIMARY KEY,
  name          VARCHAR(100) NOT NULL,
  email         VARCHAR(150) NOT NULL UNIQUE,
  password_hash VARCHAR(255) NOT NULL,
  created_at    TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- user_id NULL = categoria padrão do sistema
CREATE TABLE categories (
  id      INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NULL,
  name    VARCHAR(60) NOT NULL,
  type    ENUM('income', 'expense') NOT NULL,
  UNIQUE (user_id, name, type),
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE transactions (
  id          INT AUTO_INCREMENT PRIMARY KEY,
  user_id     INT NOT NULL,
  category_id INT NOT NULL,
  type        ENUM('income', 'expense') NOT NULL,
  amount      DECIMAL(12,2) NOT NULL CHECK (amount > 0),
  description VARCHAR(200),
  date        DATE NOT NULL,
  created_at  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  FOREIGN KEY (category_id) REFERENCES categories(id),
  INDEX idx_transactions_user_date (user_id, date)
);

-- Categorias padrão
INSERT INTO categories (user_id, name, type) VALUES
  (NULL, 'Salário', 'income'),
  (NULL, 'Freelance', 'income'),
  (NULL, 'Investimentos', 'income'),
  (NULL, 'Alimentação', 'expense'),
  (NULL, 'Moradia', 'expense'),
  (NULL, 'Transporte', 'expense'),
  (NULL, 'Saúde', 'expense'),
  (NULL, 'Lazer', 'expense'),
  (NULL, 'Educação', 'expense');