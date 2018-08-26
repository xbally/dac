/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  mateus
 * Created: 18/08/2018
 */
/*********************SISTEMA 1****************************/


CREATE TABLE tb_paciente (
    id_paciente SERIAL PRIMARY KEY,
    nome_paciente VARCHAR(100),
    telefone_paciente VARCHAR(15)
    cpf_paciente CHAR(11),
    rg_paciente VARCHAR(13),
    email_paciente VARCHAR(100),
    senha_paciente VARCHAR(100),
    pai_paciente VARCHAR(100),
    mae_paciente VARCHAR(100),
    nascimento_paciente DATE,
    id_plano INT,
    num_carteirinha_paciente VARCHAR(25),
    sexo_paciente CHAR(1),
    cep_paciente CHAR(8),
    logradouro_paciente VARCHAR(100),
    num_logradouro_paciente INT,
    complemento_paciente VARCHAR(100),
    bairro_paciente VARCHAR(50),
    cidade_paciente VARCHAR(50),
    uf_paciente CHAR(2),
    CONSTRAINT uq_email_paciente UNIQUE(email_paciente),
    CONSTRAINT uq_cpf_paciente UNIQUE(cpf_paciente),
    CONSTRAINT ck_sexo_paciente CHECK( sexo_paciente IN ('F', 'M') ),
    /*CONSTRAINT fk_paciente_plano FOREIGN KEY (id_plano) REFERENCES tb_plano_saude(id_plano)*/ 
);

CREATE TABLE tb_habito(
    id_habito SERIAL PRIMARY KEY,
    nome_habito VARCHAR(100),
    descricao_habito TEXT,
    id_paciente INT,
    CONSTRAINT fk_habito_paciente FOREIGN KEY (id_paciente) REFERENCES tb_paciente
);

CREATE TABLE tb_doenca(
    id_doenca SERIAL PRIMARY KEY,
    nome_doença VARCHAR(100),
    descricao_doenca TEXT,
    id_paciente INT,
    CONSTRAINT fk_doenca_paciente FOREIGN KEY (id_paciente) REFERENCES tb_paciente
);

CREATE TABLE tb_consulta_paciente(
    id_paciente INT,
    id_consulta INT,
    CONSTRAINT fk_cp_paciente FOREIGN KEY (id_paciente) REFERENCES tb_paciente
);

/*********************SISTEMA 2****************************/

CREATE TABLE tb_especialidade (
    id_especialidade SERIAL PRIMARY KEY,
    nome_especialidade
);

CREATE TABLE tb_plano_saude (
    id_plano SERIAL PRIMARY KEY,
    nome_plano VARCHAR(50)
);

CREATE TABLE tb_medico (
    id_medico SERIAL PRIMARY KEY,
    nome_medico VARCHAR(100),
    telefone_medico VARCHAR(15),
    cpf_medico CHAR(8),
    rg_medico VARCHAR(13),
    email_medico VARCHAR(100),
    senha_medico VARCHAR(100),
    nascimento_medico DATE,
    id_especialidade INT,
    crm_medico VARCHAR(100),
    sexo_medico CHAR(1),
    cep_medico CHAR(8),
    logradouro_medico VARCHAR(100),
    num_logradouro_medico INT,
    complemento_medico VARCHAR(100),
    bairro_medico VARCHAR(50),
    cidade_medico VARCHAR(50),
    uf_medico CHAR(2),
    CONSTRAINT uq_email_medico UNIQUE(email_medico),
    CONSTRAINT uq_cpf_medico UNIQUE(cpf_medico),
    CONSTRAINT ck_sexo_medico CHECK( sexo_medico IN ('F', 'M') ),
    CONSTRAINT fk_medico_especialidade FOREIGN KEY (id_especialidade) REFERENCES tb_especialidade(id_especialidade) 

);

CREATE tb_medico_plano (
    id_medico INT,
    id_plano INT,
    PRIMARY KEY (id_medico, id_plano),
    CONSTRAINT fk_mp_medico FOREIGN KEY (id_medico) REFERENCES tb_medico(id_medico),
    CONSTRAINT fk_mp_plano FOREIGN KEY (id_plano) REFERENCES tb_plano(id_plano)
);

CREATE tb_agenda (
    id_agenda SERIAL PRIMARY KEY,
    mês_agenda INT
)

CREATE tb_consulta (
    id_consulta SERIAL PRIMARY KEY,
    data_hora_consulta TIMESTAMP,
    id_medico INT,
    id_paciente INT,
    receita_consulta TEXT,
    id_tipo INT,
    id_status INT,
    
);

CREATE tb_exame (
    id_exame SERIAL PRIMARY KEY,
    nome_exame VARCHAR(100),
    id_consulta INT,
    CONSTRAINT fk_exame_consulta FOREIGN KEY (id_consulta) REFERENCES tb_consulta(id_consulta)
)

CREATE tb_cirurgia (
    id_cirurgia SERIAL PRIMARY KEY,
    nome_cirurgia VARCHAR(100),
    tempo_cirurgia 
);

CREATE tb_lista_espera (
    id_consulta INT,
    id_pessoa INT,
    CONSTRAINT fk_le_consulta FOREIGN KEY (id_consulta) REFERENCES tb_consulta(id_consulta),
    CONSTRAINT fk_le_pessoa FOREIGN KEY (id_pessoa) REFERENCES tb_pessoa(id_pessoa)
);

CREATE tb_tipo_consulta (
    id_tipo SERIAL PRIMARY KEY,
    nome_tipo VARCHAR(25)
);


CREATE tb_status (
    id_status SERIAL PRIMARY KEY,
    nome_status VARCHAR(25)
);
/*CREATE TABLE tb_usuario (
    id_usuario SERIAL PRIMARY KEY,
    login_usuario VARCHAR(50),
    senha_usuario VARCHAR(50),
    id_pessoa INT,
    CONSTRAINT uq_login UNIQUE (login_usuario),
    CONSTRAINT fk_usuario_pessoa FOREIGN KEY (id_pessoa) REFERENCES tb_pessoa(id_pessoa)
);*/