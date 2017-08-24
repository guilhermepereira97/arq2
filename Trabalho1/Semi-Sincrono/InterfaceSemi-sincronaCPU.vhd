library IEEE;
use IEEE.std_logic_1164.all;
package definicoesTransmissaoAssincrona is
	type ESTADO_TRANSMISSAO is (transmiteDados, esperaAck, esperaFimAck);
end definicoesTransmissaoAssincrona;

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use work.definicoesTransmissaoAssincrona.all;

entity InterfaceCPU is
	port
	(
		clock: in STD_LOGIC;
		reset: in STD_LOGIC;
		-- Interface de comunicacao assincrona --comunicacao com o periferico
		send: out STD_LOGIC;
		ack: in STD_LOGIC;
		dataOut : out STD_LOGIC_VECTOR(7 downto 0);
		-- Interface com a maquina local
		dadoDaMaq : in STD_LOGIC_VECTOR(7 downto 0); --recebe da cpu e passa p dataout que vai para a interface do periferico
		prontoParaProximoDado: out STD_LOGIC; --ack
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
			estadoTx <= transmiteDados;
			prontoParaProximoDado <= '0';
   	 		send <= '0';
		elsif clock'event and clock = '0' then
        --maquina de estados (protocolo de comunicacao)
			case estadoTx is
				when transmiteDados =>
					if transmitirDado = '1' then
                       send <='1';
                        prontoParaProximoDado <= '0';
                       regDataOut <= dadoDaMaq;
                       estadoTx <= esperaAck;
                    else
                       estadoTx <= transmiteDados;      

                    end if;
				when esperaAck =>
				       if ack = '1' then
                            send<='0';
                            regDataOut <= x"00";
                            estadoTx <=esperaFimAck;
                       else
                            estadoTx <= esperaAck;	
                       end if;
				when esperaFimAck => 
                       if ack = '0' and transmitirDado = '0' then
                            prontoParaProximoDado <= '1';
                            estadoTx <= transmiteDados;
                       else
                            
			                estadoTx <= esperaFimAck;

			           end if;
				when others => null;
			end case;
		end if;
	end process;
end InterfaceCPU;
