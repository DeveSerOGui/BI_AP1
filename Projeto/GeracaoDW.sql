
CREATE TABLE A.dim_cliente (
                sk_cliente INTEGER NOT NULL,
                nk_cliente INTEGER NOT NULL,
                nm_cliente VARCHAR(150) NOT NULL,
                etl_dt_inicio DATE NOT NULL,
                etl_dt_fim DATE NOT NULL,
                etl_dt_versao DATE NOT NULL,
                CONSTRAINT sk_cliente PRIMARY KEY (sk_cliente)
);


CREATE TABLE A.dim_compra (
                sk_frete INTEGER NOT NULL,
                nm_estado VARCHAR(150) NOT NULL,
                etl_dt_inicio DATE NOT NULL,
                etl_dt_fim DATE NOT NULL,
                etl_versao INTEGER NOT NULL,
                CONSTRAINT sk_compra PRIMARY KEY (sk_frete)
);


CREATE TABLE A.dim_site (
                sk_site INTEGER NOT NULL,
                nm_site VARCHAR(150) NOT NULL,
                etl_dt_inicio DATE NOT NULL,
                etl_dt_fim DATE NOT NULL,
                etl_versao INTEGER NOT NULL,
                CONSTRAINT sk_site PRIMARY KEY (sk_site)
);


CREATE TABLE A.dim_produto (
                sk_produto INTEGER NOT NULL,
                nm_categoria VARCHAR(150) NOT NULL,
                preco NUMERIC(10,2) NOT NULL,
                nm_produto VARCHAR(150) NOT NULL,
                etl_dt_inicio DATE NOT NULL,
                etl_dt_fim DATE NOT NULL,
                etl_versao DATE NOT NULL,
                CONSTRAINT sk_produto PRIMARY KEY (sk_produto)
);


CREATE TABLE A.ft_vendas (
                sk_vendas INTEGER NOT NULL,
                sk_cliente INTEGER NOT NULL,
                sk_frete INTEGER NOT NULL,
                sk_site INTEGER NOT NULL,
                sk_produto INTEGER NOT NULL,
                CONSTRAINT sk_vendas PRIMARY KEY (sk_vendas)
);


ALTER TABLE A.ft_vendas ADD CONSTRAINT dim_cliente_ft_vendas_fk
FOREIGN KEY (sk_cliente)
REFERENCES A.dim_cliente (sk_cliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE A.ft_vendas ADD CONSTRAINT dim_compra_ft_vendas_fk
FOREIGN KEY (sk_frete)
REFERENCES A.dim_compra (sk_frete)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE A.ft_vendas ADD CONSTRAINT dim_site_ft_vendas_fk
FOREIGN KEY (sk_site)
REFERENCES A.dim_site (sk_site)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE A.ft_vendas ADD CONSTRAINT dim_produto_ft_vendas_fk
FOREIGN KEY (sk_produto)
REFERENCES A.dim_produto (sk_produto)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
