PGDMP                        }            dberp    17.2    17.2 1    6           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            7           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            8           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            9           1262    16956    dberp    DATABASE     |   CREATE DATABASE dberp WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE dberp;
                     postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                     pg_database_owner    false            :           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                        pg_database_owner    false    4            �            1259    17074    clientes    TABLE     �   CREATE TABLE public.clientes (
    id_cliente integer NOT NULL,
    nome_cliente character varying,
    cpf_cliente character varying NOT NULL,
    celular_cliente character varying,
    data_adicionado date
);
    DROP TABLE public.clientes;
       public         heap r       postgres    false    4            ;           0    0    TABLE clientes    COMMENT     :   COMMENT ON TABLE public.clientes IS 'Tabela de Clientes';
          public               postgres    false    217            <           0    0    COLUMN clientes.id_cliente    COMMENT     H   COMMENT ON COLUMN public.clientes.id_cliente IS 'ID Único do Cliente';
          public               postgres    false    217            =           0    0    COLUMN clientes.nome_cliente    COMMENT     E   COMMENT ON COLUMN public.clientes.nome_cliente IS 'Nome do Cliente';
          public               postgres    false    217            >           0    0    COLUMN clientes.cpf_cliente    COMMENT     C   COMMENT ON COLUMN public.clientes.cpf_cliente IS 'CPF do Cliente';
          public               postgres    false    217            ?           0    0    COLUMN clientes.celular_cliente    COMMENT     S   COMMENT ON COLUMN public.clientes.celular_cliente IS 'Número Celular do Cliente';
          public               postgres    false    217            @           0    0    COLUMN clientes.data_adicionado    COMMENT     T   COMMENT ON COLUMN public.clientes.data_adicionado IS 'Data de Adição do Cliente';
          public               postgres    false    217            �            1259    17079    clientes_id_cliente_seq    SEQUENCE     �   CREATE SEQUENCE public.clientes_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.clientes_id_cliente_seq;
       public               postgres    false    217    4            A           0    0    clientes_id_cliente_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.clientes_id_cliente_seq OWNED BY public.clientes.id_cliente;
          public               postgres    false    218            �            1259    17080    endereco    TABLE     �   CREATE TABLE public.endereco (
    pais_cliente character varying,
    estado_cliente character varying,
    cidade_cliente character varying,
    bairro_cliente character varying,
    id_cliente_end integer,
    nome_cliente character varying
);
    DROP TABLE public.endereco;
       public         heap r       postgres    false    4            B           0    0    TABLE endereco    COMMENT     I   COMMENT ON TABLE public.endereco IS 'Tabela de Endereços dos Clientes';
          public               postgres    false    219            C           0    0    COLUMN endereco.pais_cliente    COMMENT     F   COMMENT ON COLUMN public.endereco.pais_cliente IS 'País do Cliente';
          public               postgres    false    219            D           0    0    COLUMN endereco.estado_cliente    COMMENT     I   COMMENT ON COLUMN public.endereco.estado_cliente IS 'Estado do Cliente';
          public               postgres    false    219            E           0    0    COLUMN endereco.cidade_cliente    COMMENT     I   COMMENT ON COLUMN public.endereco.cidade_cliente IS 'Cidade do Cliente';
          public               postgres    false    219            F           0    0    COLUMN endereco.bairro_cliente    COMMENT     I   COMMENT ON COLUMN public.endereco.bairro_cliente IS 'Bairro do Cliente';
          public               postgres    false    219            G           0    0    COLUMN endereco.id_cliente_end    COMMENT     J   COMMENT ON COLUMN public.endereco.id_cliente_end IS 'Identifica Cliente';
          public               postgres    false    219            H           0    0    COLUMN endereco.nome_cliente    COMMENT     E   COMMENT ON COLUMN public.endereco.nome_cliente IS 'Nome do Cliente';
          public               postgres    false    219            �            1259    17086    produtos    TABLE     �   CREATE TABLE public.produtos (
    id_produto integer NOT NULL,
    nome_produto character varying,
    preco_unitario money,
    qntd_estoque integer
);
    DROP TABLE public.produtos;
       public         heap r       postgres    false    4            I           0    0    COLUMN produtos.id_produto    COMMENT     H   COMMENT ON COLUMN public.produtos.id_produto IS 'ID Único do Produto';
          public               postgres    false    220            J           0    0    COLUMN produtos.nome_produto    COMMENT     P   COMMENT ON COLUMN public.produtos.nome_produto IS 'Nome ou título do Produto';
          public               postgres    false    220            K           0    0    COLUMN produtos.preco_unitario    COMMENT     H   COMMENT ON COLUMN public.produtos.preco_unitario IS 'Preço Únitario';
          public               postgres    false    220            �            1259    17091    produtos_id_produto_seq    SEQUENCE     �   CREATE SEQUENCE public.produtos_id_produto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.produtos_id_produto_seq;
       public               postgres    false    220    4            L           0    0    produtos_id_produto_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.produtos_id_produto_seq OWNED BY public.produtos.id_produto;
          public               postgres    false    221            �            1259    17092    vendas    TABLE     �   CREATE TABLE public.vendas (
    nome_vendedor character varying,
    nome_prod_vendido character varying,
    id_prod_vendido integer,
    data_venda date,
    preco_prod money,
    qntd_vendida integer
);
    DROP TABLE public.vendas;
       public         heap r       postgres    false    4            M           0    0    TABLE vendas    COMMENT     6   COMMENT ON TABLE public.vendas IS 'Tabela de Vendas';
          public               postgres    false    222            N           0    0    COLUMN vendas.nome_vendedor    COMMENT     E   COMMENT ON COLUMN public.vendas.nome_vendedor IS 'Nome do Vendedor';
          public               postgres    false    222            O           0    0    COLUMN vendas.nome_prod_vendido    COMMENT     P   COMMENT ON COLUMN public.vendas.nome_prod_vendido IS 'Nome do Produto Vendido';
          public               postgres    false    222            P           0    0    COLUMN vendas.id_prod_vendido    COMMENT     L   COMMENT ON COLUMN public.vendas.id_prod_vendido IS 'ID do Produto Vendido';
          public               postgres    false    222            Q           0    0    COLUMN vendas.data_venda    COMMENT     ?   COMMENT ON COLUMN public.vendas.data_venda IS 'Data da Venda';
          public               postgres    false    222            R           0    0    COLUMN vendas.preco_prod    COMMENT     C   COMMENT ON COLUMN public.vendas.preco_prod IS 'Preço do Produto';
          public               postgres    false    222            S           0    0    COLUMN vendas.qntd_vendida    COMMENT     N   COMMENT ON COLUMN public.vendas.qntd_vendida IS 'Quantidade que foi Vendida';
          public               postgres    false    222            �           2604    17097    clientes id_cliente    DEFAULT     z   ALTER TABLE ONLY public.clientes ALTER COLUMN id_cliente SET DEFAULT nextval('public.clientes_id_cliente_seq'::regclass);
 B   ALTER TABLE public.clientes ALTER COLUMN id_cliente DROP DEFAULT;
       public               postgres    false    218    217            �           2604    17099    produtos id_produto    DEFAULT     z   ALTER TABLE ONLY public.produtos ALTER COLUMN id_produto SET DEFAULT nextval('public.produtos_id_produto_seq'::regclass);
 B   ALTER TABLE public.produtos ALTER COLUMN id_produto DROP DEFAULT;
       public               postgres    false    221    220            .          0    17074    clientes 
   TABLE DATA           k   COPY public.clientes (id_cliente, nome_cliente, cpf_cliente, celular_cliente, data_adicionado) FROM stdin;
    public               postgres    false    217   �1       0          0    17080    endereco 
   TABLE DATA           ~   COPY public.endereco (pais_cliente, estado_cliente, cidade_cliente, bairro_cliente, id_cliente_end, nome_cliente) FROM stdin;
    public               postgres    false    219   C2       1          0    17086    produtos 
   TABLE DATA           Z   COPY public.produtos (id_produto, nome_produto, preco_unitario, qntd_estoque) FROM stdin;
    public               postgres    false    220   �2       3          0    17092    vendas 
   TABLE DATA           y   COPY public.vendas (nome_vendedor, nome_prod_vendido, id_prod_vendido, data_venda, preco_prod, qntd_vendida) FROM stdin;
    public               postgres    false    222   .3       T           0    0    clientes_id_cliente_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.clientes_id_cliente_seq', 7, true);
          public               postgres    false    218            U           0    0    produtos_id_produto_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.produtos_id_produto_seq', 8, true);
          public               postgres    false    221            �           2606    17101    clientes clientes_pk_id_cliente 
   CONSTRAINT     e   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pk_id_cliente PRIMARY KEY (id_cliente);
 I   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_pk_id_cliente;
       public                 postgres    false    217            �           2606    17103 $   clientes clientes_unique_cpf_cliente 
   CONSTRAINT     f   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_unique_cpf_cliente UNIQUE (cpf_cliente);
 N   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_unique_cpf_cliente;
       public                 postgres    false    217            �           2606    17107     produtos produtos_unique_id_prod 
   CONSTRAINT     a   ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT produtos_unique_id_prod UNIQUE (id_produto);
 J   ALTER TABLE ONLY public.produtos DROP CONSTRAINT produtos_unique_id_prod;
       public                 postgres    false    220            �           2606    17111    vendas vendas_unique_id_prod 
   CONSTRAINT     b   ALTER TABLE ONLY public.vendas
    ADD CONSTRAINT vendas_unique_id_prod UNIQUE (id_prod_vendido);
 F   ALTER TABLE ONLY public.vendas DROP CONSTRAINT vendas_unique_id_prod;
       public                 postgres    false    222            .   z   x�M�1
AF�:s
��"�O&3�Ԃ��Y�B�������xJ�e{�/j-�W�)�|Ȩ��)�1�Q���~�V�l�l����i��#���J���XI����5��Ȱ���p�R���|      0   8   x�s*J,���H,J�;���71/?5G!(3)���95��(�Ә�-1)3�+F��� �      1   �   x�e�1
1 ��+RX�l�.z��6W��6KN��������?f�ȡX�c`kja?ц��@��6�P@%�*Aˉ�XV@�)���=w>���Rǡ�7qqLV��ʒ]��S��v�"�ut��P纁흯^��;��8SJ���8b      3      x������ � �     