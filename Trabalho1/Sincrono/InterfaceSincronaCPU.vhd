library IEEE;
use IEEE.std_logic_1164.all;
package definicoesTransmissaoSincrona is
	type ESTADO_TRANSMISSAO is (clockSubir, clockDescer);
end definicoesTransmissaoSincrona;

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use work.definicoesTransmissaoSincrona.all;

entity InterfaceCPU is
	port
	(
		clock: in STD_LOGIC;
		reset: in STD_LOGIC;
		-- Interface de comunicacao assincrona --comunicacao com o periferico
		send: out STD_LOGIC;
		dataOut : out STD_LOGIC_VECTOR(7 downto 0);
		-- Interface com a maquina local
		dadoDaMaq : in STD_LOGIC_VECTOR(7 downto 0); --recebe da cpu e passa p dataout que vai para a interface do periferico
		transmitirDado: in STD_LOGIC --send
	);
end InterfaceCPU;

architecture InterfaceCPU of InterfaceCPU is
	signal estadoTx: ESTADO_TRANSMISSAO;
	signal regDataOut: STD_LOGIC_VECTOR(7 downto 0); --p escrever informacao da maquina
begin
	dataOut <= regDataOut;
	Transmissao: process(clock, reset)
	begin
		if reset = '1' then
			estadoTx <= clockSubir;
   	 		send <= '0';
		elsif clock'event then
            case estadoTX is
                when clockSubir =>
                    if clock = '1' then 
                        regDataOut <= dadoDaMaq;                    
                        send <= '0';
                        estadoTx <= clockDescer;
                    end if;
                when clockDescer =>
                    if clock = '0' then
                        send <= '1';
                        estadoTx <= clockSubir;                         
                    end if;
            end case;
		end if;
	end process;
end InterfaceCPU;
