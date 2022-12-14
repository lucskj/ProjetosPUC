drop database if exists Rede_Hospitalar;
create database Rede_Hospitalar;
use Rede_Hospitalar;

CREATE TABLE Hospital(
	idHosp int primary key,
    cidadeHosp varchar(60),
    nomeHosp varchar(50),
    classHosp int
);

CREATE TABLE Funcionario (
	idFunc int primary key,
    CPF_Func char(11),
    nomeFunc varchar(70),
    dataNascimentoFunc date,
    sexoFunc varchar(30),
    ruaFunc varchar(60),
    bairroFunc varchar(60),
    numCasaFunc int
);

CREATE TABLE HospFunc (
	idHosp int,
    idFunc int,
    cargo varchar(50),
    primary key(idHosp, idFunc, cargo),
    foreign key(idHosp) references Hospital(idHosp),
    foreign key(idFunc) references Funcionario(idFunc)
);

CREATE TABLE Cargo (
	cargo varchar(50) primary key,
    salarioFunc decimal(10, 2)
);

CREATE TABLE Medico (
    CRM char(9) primary key,
    CPF_Med char(11),
    nomeMed varchar(70),
    dataNascimentoMed date,
    sexoMed varchar(30),
    ruaMed varchar(60),
    bairroMed varchar(60),
    numCasaMed int
);

CREATE TABLE HospMed (
	idHosp int,
    CRM varchar(9),
    especializacao varchar(70),
    primary key(idHosp, CRM),
    foreign key(idHosp) references Hospital(idHosp),
    foreign key(CRM) references Medico(CRM)
);

CREATE TABLE Especializacao (
	especializacao varchar(70) primary key,
    salarioMed decimal(10, 2)
);

CREATE TABLE Consulta (
    idCons int primary key,
    CRM char(9),
    dataCons datetime,
    motivoCons varchar(100),
    duracaoCons time,
    foreign key(CRM) references Medico(CRM)
);

CREATE TABLE Exame (
    idExame int primary key,
    CRM char(9),
    dataExame datetime,
    foreign key(CRM) references Medico(CRM)
);

CREATE TABLE Plano (
    idPlano int primary key,
    nomePlano varchar(50),
    descPlano varchar(100),
    duracaoPlano int
);

CREATE TABLE HospPlano (
	idHosp int,
    idPlano int,
    precoPlano decimal(10, 2),
    primary key(idHosp, idPlano),
    foreign key(idHosp) references Hospital(idHosp),
    foreign key(idPlano) references Plano(idPlano)
);

CREATE TABLE Paciente (
	CPF_Pac char(11) primary key,
    idPlano int,
    nomePac varchar(70),
    dataNascimentoPac date,
    sexoPac varchar(30),
    ruaPac varchar(60),
    bairroPac varchar(60),
    numCasaPac int,
    foreign key(idPlano) references Plano(idPlano)
);

CREATE TABLE ExamePac (
	idExame int,
    CPF_Pac char(11),
    primary key(idExame, CPF_Pac),
    foreign key(idExame) references Exame(idExame),
    foreign key(CPF_Pac) references Paciente(CPF_Pac)
);

CREATE TABLE ConsPac (
	idCons int,
    CPF_Pac char(11),
    primary key(idCons, CPF_Pac),
    foreign key(idCons) references Consulta(idCons),
    foreign key(CPF_Pac) references Paciente(CPF_Pac)
);

CREATE TABLE HospPac (
	idHosp int,
    CPF_Pac varchar(11),
    primary key(idHosp, CPF_Pac),
    foreign key(idHosp) references Hospital(idHosp),
    foreign key(CPF_Pac) references Paciente(CPF_Pac)
);

CREATE TABLE Setor (
	idSetor int primary key,
    nomeSetor varchar(50)
);

CREATE TABLE HospSetor (
	idHosp int,
    idSetor int,
    primary key(idHosp, idSetor),
    foreign key(idHosp) references Hospital(idHosp),
    foreign key(idSetor) references Setor(idSetor)
);

CREATE TABLE Equipamento (
	idEquip int primary key,
    nomeEquip varchar(60),
    precoEquip decimal(10, 2),
	dataAquisicaoEquip date
);

CREATE TABLE Veiculo (
	idVeic int primary key,
    nomeVeic varchar(60),
    precoVeic decimal(10, 2),
	dataAquisicaoVeic date
);

CREATE TABLE Atendimento (
	idAt int primary key,
    dataAt datetime,
    horaSaidaAt datetime,
    motivoAt varchar(100),
    duracaoAt time
);

CREATE TABLE SetorEquip (
	idSetor int,
    idEquip int,
    primary key(idSetor, idEquip),
    foreign key(idSetor) references Setor(idSetor),
    foreign key(idEquip) references Equipamento(idEquip)
);

CREATE TABLE SetorVeic (
	idSetor int,
    idVeic int,
    primary key(idSetor, idVeic),
    foreign key(idSetor) references Setor(idSetor),
    foreign key(idVeic) references Veiculo(idVeic)
);

CREATE TABLE EquipExame (
	idEquip int,
    idExame int,
    primary key(idEquip, idExame),
    foreign key(idEquip) references Equipamento(idEquip),
    foreign key(idExame) references Exame(idExame)
);

CREATE TABLE VeicAt (
	idVeic int,
    idAt int,
    primary key(idVeic, idAt),
    foreign key(idVeic) references Veiculo(idVeic),
    foreign key(idAt) references Atendimento(idAt)
);


insert into Hospital values
	(1, 'Curitiba',  'Vit??ria',    6),
    (2, 'Joinville', 'Sa??de-Mais', 3),
    (3, 'Curitiba',  'Sa??de-Bem',  2),
    (4, 'S??o Paulo', 'Vida Boa',   9);

insert into Funcionario values 
	(1, '05033544900', 'Lucas',   '2002-04-03', 'Masculino', 'Maximiliano Boscardin', 'Fazendinha', 312),
    (2, '98322072113', 'Felipe',  '1999-07-21', 'Masculino', 'General Carvalho',      'Cap??o Raso', 500),
    (3, '76035278129', 'Lara',    '2000-11-13', 'Feminino',  'Fernando Cabral',       'Bigorrilho', 230),
    (4, '05832546910', 'Andr??',   '2001-07-17', 'Masculino', 'Maximiliano Boscardin', 'Fazendinha', 312),
    (5, '98382175129', 'Gabriel', '1997-10-28', 'Masculino', 'Jos?? Paes',             'Cap??o Raso', 110),
    (6, '26045218223', 'Beatriz', '1995-11-07', 'Feminino',  'Get??lio Vargas',        'Cap??o Raso',  87),
    (7, '05173532918', 'Carlos',  '2000-09-15', 'Masculino', 'Sim??o da Concei????o',    'Fazendinha', 215),
    (8, '98572031083', 'Bruno',   '1999-01-12', 'Masculino', 'Aparecida Barbosa',     'Centro',      32),
    (9, '86165098129', 'Rafaela', '1992-06-30', 'Feminino',  'Fernando Cabral',       'Bigorrilho', 230);

insert into HospFunc values 
	(1, 1, 'Faxineiro'    ),
    (1, 2, 'Seguran??a'    ),
    (2, 2, 'Seguran??a'    ),
    (1, 3, 'Recepcionista'),
    (2, 3, 'Recepcionista'),
	(2, 4, 'Faxineiro'    ),
    (3, 5, 'Seguran??a'    ),
    (3, 6, 'Recepcionista'),
	(3, 7, 'Faxineiro'    ),
    (4, 7, 'Faxineiro'    ),
    (4, 8, 'Seguran??a'    ),
    (4, 9, 'Recepcionista');

insert into Cargo values 
	('Faxineiro',      750.00),
    ('Seguran??a',     1000.00),
    ('Recepcionista',  850.00);

insert into Medico values 
	('123456789', '12330119277', 'Rodrigo', '1997-05-21', 'Masculino', 'Ara??jo Abreu',     'Bigorrilho',  120),
    ('987654321', '77291103321', 'Carla',   '1996-02-15', 'Feminino',  'Ara??jo Abreu',     'Bigorrilho',  120),
    ('892743235', '78291015317', 'Cl??udia', '1995-08-28', 'Feminino',  'Nicola Pelanda',   'Port??o',      212),
    ('214365879', '35530119187', 'Renato',  '1999-03-02', 'Masculino', 'Francisco Bonato', 'Centro',      315),
    ('926754132', '15091357321', 'Maria',   '1996-12-21', 'Feminino',  'Nicola Pelanda',   'Port??o',       28),
    ('909257313', '73861013785', 'Ana',     '1998-07-20', 'Feminino',  'Fernando Abreu',   'Pinheirinho', 158);

insert into HospMed values 
	(1, '123456789', 'Cirurgia Pl??stica'), (2, '123456789', 'Cirurgia Pl??stica'),
    (3, '123456789', 'Cirurgia Pl??stica'), (4, '123456789', 'Cirurgia Pl??stica'),
    (1, '214365879', 'Cirurgia Pl??stica'), (2, '214365879', 'Cirurgia Pl??stica'),
    (3, '214365879', 'Cirurgia Pl??stica'), (4, '214365879', 'Cirurgia Pl??stica'),
    (1, '892743235', 'Obstetria'), (2, '892743235', 'Obstetria'),
    (3, '892743235', 'Obstetria'), 
    (3, '926754132', 'Obstetria'), (4, '926754132', 'Obstetria'),
    (1, '987654321', 'Cardiologia'), 
    (2, '987654321', 'Cardiologia'),
    (3, '987654321', 'Cardiologia'), 
    (4, '987654321', 'Cardiologia'),
    (1, '909257313', 'Oftalmologia'),
    (2, '909257313', 'Oftalmologia'),
    (3, '909257313', 'Oftalmologia'),
    (4, '909257313', 'Oftalmologia');

insert into Especializacao values 
	('Cirurgia Pl??stica', 7500.00),
    ('Obstetria',         8000.00),
    ('Cardiologia',       8500.00),
    ('Oftalmologia',      7000.00);

insert into Plano values 
	(1, 'Fidelidade', 'Plano indicado a pacientes fi??is ?? unidade.',         2),
    (2, 'B??sico',     'Plano indicado a pacientes novos na rede.',           1),
    (3, 'VIP',        'Plano indicado a uma por????o exclusiva de pacientes.', 2);
    
    insert into HospPlano values 
	(1, 1, 350.00), (2, 1, 400.00),
					(2, 2, 500.00),
    (1, 3, 300.00), (2, 3, 300.00),
    (3, 1, 350.00), (4, 1, 300.00),
    (3, 2, 450.00), (4, 2, 450.00),
    (3, 3, 300.00), (4, 3, 300.00);

insert into Paciente values 
	('19239510200',    1, 'Jos??',    '2000-07-01', 'Masculino', 'Rua das Rosas',     'Centro',      202),
    ('95218237111',    1, 'Sophia',  '1998-02-02', 'Feminino',  'Cabo Branco',       'Boqueir??o',    50),
    ('95741233421',    2, 'Ana',     '1950-10-25', 'Feminino',  'Cabo Branco',       'Boqueir??o',   500),
    ('95212125071', null, 'Bruna',   '1942-08-12', 'Feminino',  'General Carneiro',  'Centro',       20),
    ('95018234215',    3, 'Robson',  '1961-06-30', 'Masculino', 'Ara??jo Fonseca',    'Manto Largo', 182),
    ('95667125082', null, 'Sandra',  '1940-04-21', 'Feminino',  'Raul Pompeia',      'Centro',      215),
    ('08518271210',    3, 'Ricardo', '1950-02-09', 'Masculino', 'Comandante Afonso', 'Pinheirinho', 330);

insert into HospPac values 
	(1, '19239510200'),
    (2, '19239510200'),
    (1, '08518271210'),
    (4, '08518271210'),
    (1, '95218237111'),
    (2, '95741233421'),
    (2, '95212125071'),
    (3, '95018234215'),
    (3, '95667125082');

insert into Consulta values 
	(1, '123456789', '2022-05-01 14:05:10', 'Paciente quer realizar procedimento est??tico no rosto.', '00:40:00'),
    (2, '123456789', '2022-02-25 18:12:27', 'Paciente deseja modificar a estrutura facial.',          '00:45:00'),
    (3, '214365879', '2022-01-30 19:00:20', 'Paciente insatisfeito com a modelagem do nariz.',        '00:40:00'),
    (4, '214365879', '2022-04-25 14:10:30', 'Modelagem facial para melhoria da est??tica.',            '00:50:00'),
    (5, '892743235', '2021-09-18 17:05:32', 'Paciente com suspeita de poss??vel gravidez.',            '00:35:00'),
    (6, '909257313', '2021-10-25 19:35:12', 'Paciente com les??o no olho.',                            '00:55:00'),
    (7, '926754132', '2022-02-01 19:40:20', 'Acompanhamento de gesta????o.',                            '00:40:00'),
    (8, '987654321', '2022-04-24 15:23:50', 'Paciente sentindo desconforto na regi??o do peitoral.',   '00:50:00');

insert into ConsPac values 
	(1, '19239510200'),
    (2, '08518271210'),
    (3, '95018234215'),
    (4, '95667125082'),
    (5, '95218237111'),
    (6, '08518271210'),
    (7, '95667125082'),
    (8, '19239510200');

insert into Exame values 
	(1, '909257313', '2021-10-25 20:35:00'),
    (2, '987654321', '2022-04-25 16:30:40'),
    (3, '214365879', '2022-04-25 15:05:00'),
    (4, '892743235', '2021-09-18 17:50:10');

insert into ExamePac values 
	(1, '08518271210'),
    (2, '19239510200'),
    (3, '95667125082'),
    (4, '95218237111');

insert into Setor values 
	(1,  'Pediatria'),
    (2,   'Cirurgia'),
    (3, 'Emerg??ncia'),
    (4, 'Enfermagem');

insert into HospSetor values 
	(1, 1), (2, 1),
    (1, 2), (2, 2),
    (1, 3), (2, 3),
    (1, 4), (2, 4),
    (3, 1), (4, 1),
    (3, 2), (4, 2),
    (3, 3), (4, 3),
    (3, 4), (4, 4);

insert into Equipamento values 
	(1, 'M??quina de Raio-X',     25000.00, '2021-04-11'),
    (2, 'Maca',                   1000.00, '2021-07-05'),
    (3, 'Estetosc??pio',            300.00, '2021-04-03'),
    (4, 'KIT de Blefaroplastia',  2000.00, '2021-06-12'),
    (5, 'KIT de Rinoplastia',     5000.00, '2021-06-20'),
    (6, 'KIT de Abdominoplastia', 3000.00, '2021-08-10'),
    (7, 'Retin??grafo',            5000.00, '2021-05-30'),
    (8, 'Ultrassom',             80000.00, '2021-02-03');

insert into SetorEquip values 
	(2, 1), (1, 1), 
	(2, 2), (1, 2),
	(2, 3), (1, 3),
	(2, 4), (3, 2),
    (2, 5), (4, 2),
    (2, 6), (4, 3),
    (2, 7),
    (2, 8); 

insert into EquipExame values 
    (3, 2), (1, 2),
    (4, 3), (5, 3),
    (7, 1), (8, 4);

insert into Veiculo values 
	(1, 'Ambul??ncia', 5000.00, '2018-06-03'),
    (2, 'Moto',       3500.00, '2015-09-08');

insert into SetorVeic values 
	(3, 1),
    (3, 2),
    (4, 1);

insert into Atendimento values 
	(1, '2021-09-08 10:05:23', '2021-09-08 10:07:51', 'Indiv??duo com poss??vel fratura na perna.', '01:30:25'),
    (2, '2021-12-02 15:07:00', '2021-12-02 15:10:20', 'Crian??a engasgada.',                        '0:47:50'),
    (3, '2022-04-17 17:23:00', '2022-04-17 17:25:20', 'Escolta para aux??lio hospitalar.',          '0:30:00');

insert into VeicAt values 
	(1, 1), (2, 1),
    (1, 2), (2, 2),
    (2, 3);
    
    
/* +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */    
-- 22 INFORMA????ES

/*
-- Quantos hospitais t??m em cada cidade?
select cidadeHosp as Cidade, count(h.cidadeHosp) as Hospitais 
from Hospital h
group by cidadeHosp; 

-- Qual ?? o hospital com a melhor classifica????o de qualidade?
select nomeHosp as Hospital, classHosp as Classifica????o 
from Hospital 
order by classHosp desc limit 1;

-- Qual ?? o plano m??dico mais aderido pelos pacientes na rede?
select nomePlano as Plano, count(pa.idPlano) as Pacientes 
from Plano pl, Paciente pa 
where pl.idPlano = pa.idPlano 
group by nomePlano 
order by Pacientes desc;

-- Quantas consultas foram realizadas em um determinado per??odo?
select count(c.idCons) as Consultas 
from Consulta c 
where c.dataCons between '2022-01-25' and '2022-04-01';		

-- Qual ?? o sexo predominante entre os funcion??rios da rede?
select sexoFunc as Sexo, count(*) as Funcion??rios 
from Funcionario 
group by sexoFunc 
order by Funcion??rios desc;

-- Qual ?? a m??dia de idade dos pacientes?
select floor(avg(timestampdiff(YEAR, dataNascimentoPac, NOW())))
as 'Idade M??dia' 
from Paciente;

-- Quais s??o os equipamentos mais novos?
select nomeEquip as Equipamento, dataAquisicaoEquip as 'Data de Aquisi????o' 
from Equipamento 
order by dataAquisicaoEquip desc;

-- Quais s??o os ve??culos mais antigos da frota?
select nomeVeic as Ve??culo, dataAquisicaoVeic as 'Data de Aquisi????o' 
from Veiculo 
order by dataAquisicaoVeic;

-- Quanto cada hospital rende com os planos aderidos?
select   nomeHosp as Hospital, sum(precoPlano) as Renda
from     Hospital h, HospPlano hpl, Paciente p, HospPac hpa
where    h.idHosp = hpa.idHosp
and      p.CPF_Pac = hpa.CPF_Pac 
and      h.idHosp = hpl.idHosp
and      hpl.idPlano = p.idPlano
group by nomeHosp;

-- Quais equipamentos fazem parte do setor de Enfermagem?
select nomeEquip as Equipamento 
from Setor s, Equipamento e, SetorEquip se 
where s.idSetor = 4 									
and se.idSetor = s.idSetor 									
and e.idEquip = se.idEquip;

-- Qual ?? o bairro com a maior presen??a de pacientes no hospital Sa??de-Mais?
select nomeHosp as Hospital, bairroPac as Bairro, count(p.CPF_Pac) as Pacientes
from Hospital h, Paciente p, HospPac hp
where h.idHosp = 2										
and hp.idHosp = h.idHosp									
and hp.CPF_Pac = p.CPF_Pac
group by bairroPac;

-- Qual ?? o n??mero de pacientes idosos (acima de 60 anos) com plano m??dico?
select count(p.CPF_Pac) as Pacientes
from Paciente p
where floor(timestampdiff(YEAR, dataNascimentoPac, NOW())) > 60
and p.idPlano != 'null';

-- Quais s??o as especializa????es mais presentes no hospital Sa??de-Bem?
select especializacao as Especializa????o, count(*) as M??dicos
from HospMed hm, Medico m, Hospital h
where h.idHosp = 3
and hm.idHosp = h.idHosp
and hm.CRM = m.CRM
group by especializacao
order by M??dicos desc;

-- Quais equipamentos est??o no setor de Cirurgia e n??o est??o na Pediatria?
select nomeEquip as Equipamentos
from Setor s, Equipamento e, SetorEquip se 
where s.idSetor = 2 						
and se.idSetor = s.idSetor	
and e.idEquip = se.idEquip										
and nomeEquip not in 
	(select nomeEquip as Equipamentos
	from Setor s, Equipamento e, SetorEquip se 
	where s.idSetor = 1
	and se.idSetor = s.idSetor 									
	and e.idEquip = se.idEquip);	

-- Qual o ve??culo que mais realizou atendimentos?
select nomeVeic as Ve??culo, count(*) as Atendimentos
from Veiculo, VeicAt
where Veiculo.idVeic = VeicAt.idVeic
group by nomeVeic
order by Atendimentos desc;

-- Qual ?? o m??dico que mais participou de consultas? 
select nomeMed as M??dico, count(*) as Consultas
from Medico, Consulta
where Medico.CRM = Consulta.CRM
group by Medico.CRM;

-- Qual foi o atendimento mais demorado?
select idAt as Atendimento, motivoAt as Motivo, duracaoAt as Dura????o
from Atendimento
order by duracaoAt desc;

-- Qual foi a consulta mais curta?
select idCons as Consulta, motivoCons as Motivo, duracaoCons as Dura????o
from Consulta
order by duracaoCons;

-- Qual a m??dia de tempo de dura????o das consultas?
select FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(duracaoCons)), '%i:%s') AS 'Dura????o M??dia'
from Consulta;

-- Qual foi a data com o maior n??mero de exames?
select date(dataExame) as 'Data', count(*) as Exames
from Exame
group by date(dataExame)
order by Exames desc;

-- Qual hospital apresenta o paciente X?
-- Produto Cartesiano:
select nomeHosp as Hospital
from Hospital h, HospPac hp, Paciente p 
where p.nomePac = "Ricardo"
and p.CPF_Pac = hp.CPF_Pac
and hp.idHosp = h.idHosp;

-- Jun????o:
select nomeHosp as Hospital
from Hospital h
inner join HospPac hp
on hp.idHosp = h.idHosp
inner join Paciente p 
on p.CPF_Pac = hp.CPF_Pac
where p.nomePac = "Ricardo";

-- Quais pacientes est??o vinculados ao hospital Sa??de-Bem e n??o ao Vit??ria?
select nomePac as Pacientes
from Hospital h, Paciente p, HospPac hp 
where h.idHosp = 3
and hp.idHosp = h.idHosp 									
and p.CPF_Pac = hp.CPF_Pac 										
and nomePac not in 
	(select nomePac as Pacientes
	from Hospital h, Paciente p, HospPac hp 
	where h.idHosp = 1
	and hp.idHosp = h.idHosp 									
	and p.CPF_Pac = hp.CPF_Pac);	*/


/* +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ */
-- 2 TRANSA????ES

/* TRANSA????O 01 */ 
/* Definindo uma transa????o que ter?? o objetivo de alterar o plano atual de um paciente para um plano novo,
   assegurando que o hospital tenha o plano e que o paciente apresente rela????o com o hospital.	*/

SET AUTOCOMMIT = OFF;
DELIMITER //

CREATE PROCEDURE mudar_plano(id_hosp INTEGER, planoNovo INTEGER, paciente char(11))
BEGIN
	DECLARE planoAntigo INTEGER;					-- Vari??vel respons??vel por armazenar o plano antigo do paciente.
    DECLARE contadorPlano INTEGER default 0;		-- Vari??vel que definir?? se o hospital em quest??o possui o plano desejado.
    DECLARE contadorPaciente INTEGER default 0;		-- Vari??vel para checar se o paciente est?? cadastrado no hospital.
    
	START TRANSACTION;
    SELECT idPlano INTO @planoAntigo 
    FROM Paciente 
    WHERE CPF_Pac = paciente;
    
    SELECT count(*) INTO @contadorPlano 
    FROM HospPlano 
    WHERE idPlano = planoNovo 
    and idHosp = id_hosp;
    
    SELECT count(CPF_Pac) INTO @contadorPaciente 
    FROM HospPac 
    WHERE idHosp = id_hosp
    and CPF_Pac = paciente;
    
    
    
    IF (@planoAntigo <> planoNovo 					-- Verificando se os planos s??o diferentes para realizar a altera????o.
		and @contadorPlano <> 0 					-- Checando se o plano existe no hospital.
        and @contadorPaciente <> 0) 				-- Conferindo se o paciente tem rela????o com o hospital.
        THEN UPDATE Paciente 						-- Atualizando os dados, caso as verifica????es estejam de acordo.
			 SET idPlano = planoNovo 
			 WHERE CPF_Pac = paciente; 
			 COMMIT;								
	ELSE
		ROLLBACK;									-- Impedindo a atualiza????o de dados se houver irregularidades.
	END IF;
END//

DELIMITER ;


/* TRANSA????O 02 */ 
/* Definindo uma transa????o que ter?? o objetivo de vincular um equipamento a um novo setor,
   contanto que o hospital apresente o setor e que o equipamento n??o esteja no setor desejado.	*/

SET AUTOCOMMIT = OFF;
DELIMITER //

CREATE PROCEDURE add_equip_to_setor(id_hosp INTEGER, setorNovo INTEGER, equipamento INTEGER)
BEGIN
	DECLARE contadorEquip INTEGER default 0;		-- Vari??vel que verifica se o equipamento j?? est?? vinculado ao novo setor.
    DECLARE contadorSetor INTEGER default 0;		-- Vari??vel que confirma se o hospital em quest??o possui o setor desejado.
    
	START TRANSACTION;
    SELECT count(*) INTO @contadorEquip 
    FROM SetorEquip 
    WHERE idEquip = equipamento
    and idSetor = setorNovo;
    
    SELECT count(*) INTO @contadorSetor 
    FROM HospSetor 
    WHERE idSetor = setorNovo 
    and idHosp = id_hosp;
    
    IF (@contadorEquip = 0 							-- Garantindo que o equipamento ainda n??o est?? no setor desejado.
		and @contadorSetor <> 0) 					-- Checando se o setor existe dentro do hospital.
	THEN INSERT INTO SetorEquip 					-- Atualiza????o dos dados, caso as verifica????es estejam de acordo.
		 VALUES (setorNovo, equipamento); 			
		 COMMIT;									
	ELSE
		ROLLBACK;									-- Impedindo a atualiza????o de dados se houver irregularidades.
	END IF;
END//

DELIMITER ;
