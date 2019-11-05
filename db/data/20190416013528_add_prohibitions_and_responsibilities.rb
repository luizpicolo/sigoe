# frozen_string_literal: true

class AddProhibitionsAndResponsibilities < SeedMigration::Migration
  def up
    Incident::ProhibitionAndResponsibility.create!([
                                                     { item: 'I - Proceder de forma desrespeitosa, provocando ou participando de algazarras ou outras manifestações que prejudiquem ou interrompam atividades de ensino, pesquisa, extensão e administração' },
                                                     { item: 'II - Proceder de forma desrespeitosa, causando danos ao patrimônio público ou particulares' },
                                                     { item: 'III - Cometer agressão verbal ou física contra qualquer pessoa no âmbito da instituição ou contra o IFMS' },
                                                     { item: 'IV - Praticar bullying, cyber bullying ou qualquer tipo de discriminação seja social, econômica, etária, de gênero, raça, cor, etnia, orientação sexual, opção religiosa ou de qualquer outra natureza' },
                                                     { item: 'V- Assistir às aulas sem a efetivação da matrícula' },
                                                     { item: 'VI - Usar de terceiros ou de meios ilícitos para auferir frequência, nota ou conceito, tais como consulta não autorizada de qualquer natureza durante a realização de atividades avaliativas, plágio' },
                                                     { item: 'VII- Alterar ou deturpar o teor de documentos oficiais do IFMS' },
                                                     { item: 'VIII- Usar a logomarca do IFMS de forma indevida ou não autorizada' },
                                                     { item: 'IX - Retirar de qualquer ambiente, sem estarem legalmente autorizados, documentos, livros, equipamentos ou bens pertencentes ao patrimônio público ou a terceiros' },
                                                     { item: 'X - Fumar nas dependências do IFMS, portar, comercializar ou fazer uso de bebidas alcoólicas, ou substância tóxica entorpecente' },
                                                     { item: 'XI - Participar de atividade ou nela permanecer sob efeito de substância tóxica entorpecente' },
                                                     { item: 'XII- Praticar jogos de azar ou atos que revelem falta de idoneidade' },
                                                     { item: 'XIII- Apresentar comportamentos inadequados ao ambiente educacional/profissional que não condizam com as práticas e o ambiente escolar' },
                                                     { item: 'XIV - Facilitar a entrada de pessoas não identificadas/autorizadas na instituição' },
                                                     { item: 'XV - Emprestar instrumento oficial de identificação do IFMS a terceiro, colaborando com situação de falsa identidade' },
                                                     { item: 'XVI- Exercer atividades político-partidárias no âmbito do IFMS' },
                                                     { item: 'XVII - Exercer atividades comerciais ou de propaganda no âmbito do IFMS, excetuando-se os casos devidamente autorizados' },
                                                     { item: 'XVIII - Utilizar equipamentos da instituição em atividades alheias às de ensino, pesquisa e extensão' },
                                                     { item: 'XIX - Interromper as atividades de ensino sem autorização do docente e coordenação' },
                                                     { item: 'XX - Utilizar aparelhos eletrônicos, salvo em situações devidamente autorizadas que contribuam com o bom rendimento do processo de ensino e aprendizagem' },
                                                     { item: 'XXI - Portar ou fazer uso de armas, materiais inflamáveis, objetos cortantes, explosivos de qualquer natureza, que representem perigo para si e para a comunidade; XXII- Organizare/oupraticartrotequeenvolvaaçãovexatóriaoudanosa' },
                                                     { item: 'XXIII - Ausentar-se do campus em horário de aula sem autorização expressa do responsável em caso de estudante menor de 18 anos' },
                                                     { item: 'XXIV - Produzir e reproduzir material audiovisual impróprio que denigra a imagem do IFMS ou de qualquer pessoa no âmbito da instituição' }
                                                   ])
  end
end
