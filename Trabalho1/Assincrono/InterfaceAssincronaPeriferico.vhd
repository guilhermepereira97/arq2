library IEEE;
use IEEE.std_logic_1164.all;
package definicoesRecepcaoAssincrona is
	type ESTADO_TRANSMISSAO is (esperaSend,gerenciaAck);
end definicoesRecepcaoAssincrona;

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use work.definicoesRecepcaoAssincrona.all;

--criar estados vide cpu
entity InterfacePeriferico is
	port
	(
		clock: in STD_LOGIC;
		reset: in STD_LOGIC;
		-- Interface de comunicacao assincrona 
		receive: in STD_LOGIC; -- send
		accept: out STD_LOGIC; -- ack
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
			accept <= '0';
		elsif clock'event and clock = '0' then
			case estadoTx is
				when esperaSend =>
                    if receive = '1' then
                        dadoRecebido <= '1';
                        accept <= '1';
                        regDataIn <= dataIn;
                        estadoTx <= gerenciaAck;
                    end if;

                when gerenciaAck =>
                    dadoRecebido <= '0';
                    if receive = '0' then
                        accept <= '0';
                        estadoTx <= esperaSend;
                    end if;
             end case;   
     
		end if;
  end process;
end InterfacePeriferico;
