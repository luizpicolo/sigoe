# frozen_string_literal: true

class AddProhibitionsAndResponsibilities < SeedMigration::Migration
  def up
    Incident::ProhibitionAndResponsibility.create!([
      { item: 'I - proceder de forma desrespeitosa, provocando ou participando de algazarras ou manifestações que prejudiquem ou interrompam atividades de ensino, pesquisa, extensão e administração', status: true },
      { item: 'II - interromper atividades de ensino sem autorização do docente ou da coordenação', status: true },
      { item: 'III - utilizar aparelhos eletrônicos, salvo quando devidamente autorizado para realização de atividades que contribuam para os processos de ensino e de aprendizagem', status: true },
      { item: 'IV - realizar consulta não autorizada, de qualquer natureza, durante a realização de atividades avaliativas', status: true },
      { item: 'V - praticar ato que caracterize plágio', status: true },
      { item: 'VI - assistir às aulas de unidades curriculares nas quais a solicitação de matrícula não tenha sido deferida', status: true },
      { item: 'VII - valer-se de terceiros ou de meios ilícitos para auferir frequência em aulas ou em demais atividades acadêmicas', status: true },
      { item: 'VIII - ausentar-se, durante suas atividades acadêmicas, de sala de aula ou de outro ambiente de aprendizagem, sem a devida autorização do professor', status: true },
      { item: 'IX - ausentar-se do campus, em horário de aula, sem autorização expressa da coordenação e de seu responsável legal, quando menor de 18 (dezoito) anos', status: true },
      { item: 'X - agir agressiva ou desrespeitosamente, de forma verbal ou física, com qualquer pessoa', status: true },
      { item: 'XI - praticar bullying, cyberbullying ou qualquer tipo de discriminação, seja social, econômica, etária, de gênero, raça, cor, etnia, orientação sexual, credo religioso ou de qualquer outra natureza', status: true },
      { item: 'XII - criar, estimular e/ou compartilhar, no âmbito do IFMS ou em ambientes virtuais, conteúdo discriminatório ou que exponha estudantes, servidores ou colaboradores a situações vexatórias e que possam causar danos emocionais, bem como apologia a ideias contrárias à ética ou às liberdades individuais e coletivas', status: true },
      { item: 'XIII - organizar e/ou praticar trote que envolva ação vexatória ou danosa', status: true },
      { item: 'XIV - praticar importunação sexual ou ato libidinoso nas dependências do IFMS', status: true },
      { item: 'XV - produzir ou reproduzir material audiovisual contrário aos valores éticos institucionais e que prejudique a imagem social do IFMS', status: true },
      { item: 'XVI - usar ou associar, de forma indevida ou não autorizada, a logomarca ou o nome do IFMS', status: true },
      { item: 'XVII - alterar ou deturpar o teor de documentos oficiais, bem como acessar dados ou informações sigilosas do IFMS', status: true },
      { item: 'XVIII - retirar, sem autorização, documentos, livros, equipamentos, mobiliários ou bens pertencentes ao patrimônio público ou a terceiros de qualquer ambiente do IFMS', status: true },
      { item: 'XIX - causar danos ao patrimônio público ou particular', status: true },
      { item: 'XX - ingressar na instituição, nela permanecer ou participar de qualquer atividade alcoolizado ou sob efeito de substância entorpecente', status: true },
      { item: 'XXI - portar, comercializar ou fazer uso de bebidas alcoólicas e de demais substâncias entorpecentes', status: true },
      { item: 'XXII - fumar, portar, comercializar ou fazer qualquer outro uso de produto fumígeno no âmbito do IFMS', status: true },
      { item: 'XXIII - praticar jogos de azar. São exceções os jogos autorizados pelo docente ou equipe gestora no campus, cujos objetivos sejam o desenvolvimento de habilidades cognitivas importantes para o processo de ensino e aprendizagem do educando', status: true },
      { item: 'XXIV - facilitar a entrada de pessoas não autorizadas na instituição', status: true },
      { item: 'XXV - emprestar instrumento oficial de identificação do IFMS a terceiros, colaborando com situação de falsa identidade', status: true },
      { item: 'XXVI - exercer atividades político-partidárias no âmbito do IFMS', status: true },
      { item: 'XXVII - exercer atividades comerciais ou de propaganda, excetuando-se os casos devidamente autorizados por autoridade competente', status: true },
      { item: 'XXVIII - portar ou fazer uso de armas, de materiais inflamáveis, de objetos cortantes ou de explosivos de qualquer natureza, que representem perigo para si e para qualquer membro da comunidade acadêmica', status: true },
    ])
  end
end
