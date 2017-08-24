library IEEE;
use IEEE.std_logic_1164.all;
package definicoesRecepcaoSincrona is
	type ESTADO_TRANSMISSAO is (esperaSend,gerenciaAck);
end definicoesRecepcaoSincrona;

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use work.definicoesRecepcaoSincrona.all;

--criar estados vide cpu
entity InterfacePeriferico is
	port
	(
		clock: in STD_LOGIC;
		reset: in STD_LOGIC;
		-- Interface de comunicacao assincrona 
		dataIn: in STD_LOGIC_VECTOR(7 downto 0);
		-- Interface com a maquina local
		dadoParaMaq: out STD_LOGIC_VECTOR(7 downto 0);
		dadoRecebido: out STD_LOGIC
	);
end InterfacePeriferico;

architecture InterfacePeriferico of InterfacePeriferico is
	signal regDataIn: STD_LOGIC_VECTOR(7 downto 0);
    signal estadoTx: ESTADO_TRANSMISSAO;
begin
	dadoParaMaq <= regDataIn;
	Recepcao: process(clock, reset)
	begin
		if reset = '1' then
			dadoRecebido <= '0';
		elsif clock'event and clock = '0' then
            regDataIn <= dataIn;
            dadoRecebido <= '1';
		end if;
  end process;
end InterfacePeriferico;
