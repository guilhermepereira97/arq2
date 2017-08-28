library IEEE;
use IEEE.std_logic_1164.all;
package definicoesTransmissaoAssincrona is
	type ESTADO_TRANSMISSAO is (transmiteDados, , esperaFimAck);
end definicoesTransmissaoAssincrona;

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_unsigned.all;

entity CPU is
	port
	(
		clock: in STD_LOGIC;
		reset: in STD_LOGIC;
		-- Interface com a interface de comunicacao
		dadoParaInterface: out STD_LOGIC_VECTOR(7 downto 0);  
        dadoDaInterface: in STD_LOGIC_VECTOR(7 downto 0); 
		prontoParaProximoDado: in STD_LOGIC; --ack
		transmitirDado: out STD_LOGIC --send
	);
end CPU;

architecture CPU of CPU is
	signal dado: STD_LOGIC_VECTOR(7 downto 0);
	signal contador: STD_LOGIC_VECTOR(15 downto 0);
    signal cont_dados: STD_LOGIC_VECTOR(5 downto 0);
begin
	
    delay: process(clock, reset)
    begin
        if reset = '1' then
           cont_dados <= 0;
        elsif clock'event and clock='1' then
            cont_delay<= cont_delay + 1;
        end if;
    end process;
    
	Transmissao: process(clock, reset)
	begin
		if reset = '1' then
			dado <= x"00";
			transmitirDado <= '1';
			contador <= (others=>'0');
		elsif clock'event and clock = '1' then
         case estadoCPU is
                geraDados =>	
                    if cont_dados < 5 then		
                        if prontoParaProximoDado = '1' and contador < 20 then
				            dado <= dado + 1;
				            contador <= contador + 1;
				            transmitirDado <= '1';
			                cont_dados = cont_dados + 1;
                        else
				            transmitirDado <= '0';
			            end if;
                   else
                       estadoCPU <= esperaCiclo;
                       esperaCiclo=> 
                    if cont_delay < 3 then
                        estadoCPU <= esperaCiclo;
                    else
                        estadoCPU <= recebeDado;
                
                recebeDado =>
                         		    
                end if;
	end process;
end CPU;
