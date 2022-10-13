
CREATE TABLE public.Dim_Organizacional (
                Cod_Organizacional VARCHAR(50) NOT NULL,
                Desc_Organizacional VARCHAR(250) NOT NULL,
                Cod_Pai VARCHAR(50) NOT NULL,
                Esquerda INTEGER NOT NULL,
                Direita INTEGER NOT NULL,
                Nivel INTEGER NOT NULL,
                CONSTRAINT dim_organizacional_pk PRIMARY KEY (Cod_Organizacional)
);


CREATE TABLE public.Dim_Categoria (
                Cod_Categoria VARCHAR(50) NOT NULL,
                Desc_Categoria VARCHAR(250) NOT NULL,
                CONSTRAINT dim_categoria_pk PRIMARY KEY (Cod_Categoria)
);


CREATE TABLE public.Dim_Marca (
                Cod_Marca VARCHAR(50) NOT NULL,
                Desc_Marca VARCHAR(250) NOT NULL,
                Cod_Categoria VARCHAR(50) NOT NULL,
                CONSTRAINT dim_marca_pk PRIMARY KEY (Cod_Marca)
);


CREATE TABLE public.Dim_Produto (
                Cod_Produto VARCHAR(50) NOT NULL,
                Cod_Marca VARCHAR(50) NOT NULL,
                Desc_Produto VARCHAR(250) NOT NULL,
                Atr_Tamanho VARCHAR(250) NOT NULL,
                Atr_Sabor VARCHAR(250) NOT NULL,
                CONSTRAINT dim_produto_pk PRIMARY KEY (Cod_Produto)
);


CREATE TABLE public.Dim_Tempo (
                Cod_Tempo VARCHAR(50) NOT NULL,
                data DATE NOT NULL,
                Numero_dia_semana VARCHAR(50) NOT NULL,
                Numero_do_mes VARCHAR(50) NOT NULL,
                Numero_do_Ano VARCHAR(50) NOT NULL,
                Nome_Mes VARCHAR(250) NOT NULL,
                Numero_Trimestre VARCHAR(50) NOT NULL,
                Nome_Trimestre VARCHAR(250) NOT NULL,
                Numero_Semestre VARCHAR(50) NOT NULL,
                Nome_Semestre VARCHAR(250) NOT NULL,
                CONSTRAINT dim_tempo_pk PRIMARY KEY (Cod_Tempo)
);


CREATE TABLE public.Dim_cliente (
                Cod_cliente VARCHAR(50) NOT NULL,
                Cod_Estado VARCHAR(50) NOT NULL,
                Cod_Segmento VARCHAR(50) NOT NULL,
                Desc_Segmento VARCHAR(250) NOT NULL,
                Desc_Cliente VARCHAR(250) NOT NULL,
                Cod_Regiao VARCHAR(50) NOT NULL,
                Desc_Estado VARCHAR(250) NOT NULL,
                Desc_Regiao VARCHAR(50) NOT NULL,
                Desc_Cidade VARCHAR(250) NOT NULL,
                CONSTRAINT dim_cliente_pk PRIMARY KEY (Cod_cliente)
);
COMMENT ON TABLE public.Dim_cliente IS 'tabela dim cliente';


CREATE TABLE public.Dim_Fabrica (
                cod_fabrica VARCHAR(50) NOT NULL,
                Desc_Fabrica VARCHAR(255) NOT NULL,
                CONSTRAINT dim_fabrica_pk PRIMARY KEY (cod_fabrica)
);
COMMENT ON TABLE public.Dim_Fabrica IS 'Tabela dimensão fabrica';


CREATE TABLE public.Fact_001 (
                Cod_Fabrica VARCHAR(50) NOT NULL,
                Cod_Tempo VARCHAR(50) NOT NULL,
                Cod_Cliente VARCHAR(50) NOT NULL,
                Cod_Organizacional VARCHAR(50) NOT NULL,
                Cod_Produto VARCHAR(50) NOT NULL,
                Cod_Tempo_1 VARCHAR(50) NOT NULL,
                Cod_Organizacional_1 VARCHAR(50) NOT NULL,
                Faturamento DOUBLE PRECISION NOT NULL,
                Unidade_Vendida DOUBLE PRECISION NOT NULL,
                Quantidade_Vendida DOUBLE PRECISION NOT NULL,
                Imposto DOUBLE PRECISION NOT NULL,
                Custo_Variavel DOUBLE PRECISION NOT NULL,
                CONSTRAINT fact_001_pk PRIMARY KEY (Cod_Fabrica, Cod_Tempo, Cod_Cliente, Cod_Organizacional, Cod_Produto, Cod_Tempo_1, Cod_Organizacional_1)
);


ALTER TABLE public.Fact_001 ADD CONSTRAINT dim_organizacional_fact_001_fk
FOREIGN KEY (Cod_Organizacional_1)
REFERENCES public.Dim_Organizacional (Cod_Organizacional)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Dim_Marca ADD CONSTRAINT dim_categoria_dim_marca_fk
FOREIGN KEY (Cod_Categoria)
REFERENCES public.Dim_Categoria (Cod_Categoria)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Dim_Produto ADD CONSTRAINT dim_marca_dim_produto_fk
FOREIGN KEY (Cod_Marca)
REFERENCES public.Dim_Marca (Cod_Marca)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Fact_001 ADD CONSTRAINT dim_produto_fact_001_fk
FOREIGN KEY (Cod_Produto)
REFERENCES public.Dim_Produto (Cod_Produto)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Fact_001 ADD CONSTRAINT dim_tempo_fact_001_fk
FOREIGN KEY (Cod_Tempo_1)
REFERENCES public.Dim_Tempo (Cod_Tempo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Fact_001 ADD CONSTRAINT dim_cliente_fact_001_fk
FOREIGN KEY (Cod_cliente)
REFERENCES public.Dim_cliente (Cod_cliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Fact_001 ADD CONSTRAINT dim_fabrica_fact_001_fk
FOREIGN KEY (Cod_Fabrica)
REFERENCES public.Dim_Fabrica (cod_fabrica)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;





