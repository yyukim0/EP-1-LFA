class TradutorRomano
  def initialize(cadeia)
    @cadeia = cadeia.upcase
    @indice = 0
    @max = @cadeia.size
    @total = 0
  end

  def proximo
    @indice == @max ? "" : @cadeia[@indice]
  end

  def iniciar
    estado = "qM0"
    puts "Máquina iniciou no estado: #{estado}"

    loop do
      simbolo = proximo
      
      case [simbolo, estado]
      
      #MILHARES
      in ["M", "qM0"] then estado = transicao("qM1", 1000)
      in ["M", "qM1"] then estado = transicao("qM2", 1000)
      in ["M", "qM2"] then estado = transicao("qM3", 1000)
      in [_, "qM0"] | [_, "qM1"] | [_, "qM2"] | [_, "qM3"] 
        estado = "qC0" 

      #CENTENAS
      in ["C", "qC0"] then estado = avancar_estado("qC1")
      in ["D", "qC1"] then estado = transicao("qD0", 400) 
      in ["M", "qC1"] then estado = transicao("qD0", 900) 
      in ["C", "qC1"] then estado = avancar_estado("qC2")
      in ["C", "qC2"] then estado = avancar_estado("qC3")
      in ["D", "qC0"] then estado = transicao("qC0", 500)
      
      in [_, "qC1"] then estado = epsilon_com_valor("qD0", 100)
      in [_, "qC2"] then estado = epsilon_com_valor("qD0", 200)
      in [_, "qC3"] then estado = epsilon_com_valor("qD0", 300)
      in [_, "qC0"] then estado = "qD0"

      #DEZENAS
      in ["X", "qD0"] then estado = avancar_estado("qD1")
      in ["L", "qD1"] then estado = transicao("qU0", 40) 
      in ["C", "qD1"] then estado = transicao("qU0", 90) 
      in ["X", "qD1"] then estado = avancar_estado("qD2")
      in ["X", "qD2"] then estado = avancar_estado("qD3")
      in ["L", "qD0"] then estado = transicao("qD0", 50)

      in [_, "qD1"] then estado = epsilon_com_valor("qU0", 10)
      in [_, "qD2"] then estado = epsilon_com_valor("qU0", 20)
      in [_, "qD3"] then estado = epsilon_com_valor("qU0", 30)
      in [_, "qD0"] then estado = "qU0"

      #UNIDADES
      in ["I", "qU0"] then estado = avancar_estado("qU1")
      in ["V", "qU1"] then estado = transicao("qU_FIM", 4) 
      in ["X", "qU1"] then estado = transicao("qU_FIM", 9) 
      in ["I", "qU1"] then estado = avancar_estado("qU2")
      in ["I", "qU2"] then estado = avancar_estado("qU3")
      in ["V", "qU0"] then estado = transicao("qU0", 5)

      in [_, "qU1"] then estado = epsilon_com_valor("qU_FIM", 1)
      in [_, "qU2"] then estado = epsilon_com_valor("qU_FIM", 2)
      in [_, "qU3"] then estado = epsilon_com_valor("qU_FIM", 3)

      #FINALIZA
      in ["", "qU0"] | ["", "qU_FIM"]
        puts "Aceito 😀 | Total: #{@total}"
        break
      else
        puts "Erro: Símbolo '#{simbolo}' inválido para o estado #{estado}"
        break
      end
    end
  end

  private

  def transicao(novo_estado, valor)
    @total += valor
    @indice += 1
    puts "Soma: +#{valor} | Novo Estado: #{novo_estado}"
    novo_estado
  end

  def avancar_estado(novo_estado)
    @indice += 1
    puts "Estado de Espera: #{novo_estado}"
    novo_estado
  end

  def epsilon_com_valor(novo_estado, valor)
    @total += valor
    puts "Soma dos valores: +#{valor} | Pulando para: #{novo_estado}"
    novo_estado
  end
end

adf = TradutorRomano.new("MCMXCIV")
adf.iniciar
