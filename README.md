# EP 1 - LFA
##### Feito por Kauê e Danilo

Optamos pelo Transdutor de Mealy devido à natureza da gramática romana. No sistema romano, o valor de um símbolo é determinado pela relação com o símbolo seguinte.

- Eficiência de Estados: No Mealy, a saída é gerada na transição. Isso nos permite tratar casos como IV (4) e IX (9) saindo de um único estado de espera (q1​) apenas mudando a transição. Se usássemos Moore, precisaríamos de estados específicos para "Estado do 4" e "Estado do 9", o que aumentaria drasticamente a complexidade do diagrama.

- Contexto Imediato: O Mealy permite que o autômato "reaja" ao par de símbolos (Estado Atual + Entrada) instantaneamente, o que é ideal para processar strings de texto onde a semântica muda conforme o próximo caractere.

Algumas transições podem não ter um alfabeto de saída quando lídamos com o vazio para a transição de uma caixa a outra, ou para a chegada de estados finais. Elas, porém podem emitir símbolos, que seriam os números romanos.

Esse seria o Transdutor


<img width="1559" height="631" alt="image" src="https://github.com/user-attachments/assets/2aa5509d-76e9-4977-af35-86c1f42da56d" />
