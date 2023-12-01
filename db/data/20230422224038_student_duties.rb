# frozen_string_literal: true

class StudentDuties < SeedMigration::Migration
  def up
    Incident::StudentDuty.create!([
      { item: 'I - ser assíduo e pontual em suas atividades acadêmicas', status: true },
      { item: 'II - participar efetiva e atentamente das aulas, contribuindo com o ambiente de aprendizagem e com a manutenção do respeito interpessoal', status: true },
      { item: 'III - participar, de forma colaborativa e respeitosa, das atividades curriculares e extracurriculares propostas aos discentes', status: true },
      { item: 'IV - acompanhar as comunicações internas veiculadas nos quadros de avisos, via e-mail institucional, ou por qualquer outro meio de comunicação oficial', status: true },
      { item: 'V - comparecer, quando convocado, a reuniões de órgãos colegiados, direções, setores e coordenações, para fins de deliberação ou de representação', status: true },
      { item: 'VI - obedecer aos prazos estabelecidos nas normativas institucionais e no calendário acadêmico', status: true },
      { item: 'VII - manter seus dados cadastrais atualizados na instituição', status: true },
      { item: 'VIII - respeitar colegas, servidores, colaboradores e demais membros da comunidade interna ou externa da instituição', status: true },
      { item: 'IX - não ferir a integridade física e moral de pessoas no âmbito institucional', status: true },
      { item: '{ item: X - prestar informações à gestão escolar sobre fatos que coloquem em risco a segurança de qualquer membro da comunidade acadêmica ou o patrimônio do IFMS', status: true },
      { item: 'XI - zelar por todo material didático disponibilizado pelo IFMS, mantendo-o em bom estado de conservação', status: true },
      { item: 'XII - responsabilizar-se por materiais escolares e pertences pessoais trazidos para o IFMS', status: true },
      { item: 'XIII - cumprir normas de acesso e permanência, de utilização de equipamentos e de prevenção de acidentes do IFMS', status: true },
      { item: 'XIV - apresentar-se para as atividades de ensino devidamente trajado: camiseta, obrigatoriamente a oficial do IFMS, quando fornecida pela instituição, calça, bermuda ou saia, salvo em locais ou atividades que exijam um tipo de vestimenta específica, a exemplo das aulas de educação física', status: true },
      { item: 'XV - estar sempre em posse da Identidade Estudantil, preferencialmente na versão física, para acesso e permanência nas dependências do IFMS', status: true },
      { item: 'XVI - usar vestuário e calçado adequados às normas de segurança do trabalho em laboratórios, aulas de campo, atividades de estágio e visitas técnicas, observadas as exigências do local de visitação', status: true },
      { item: 'XVII - manter silêncio nas proximidades de salas de aula, laboratórios, biblioteca e demais dependências do campus durante o desenvolvimento de atividades acadêmicas', status: true },
      { item: 'XVIII - respeitar a propriedade intelectual e cultural, seguindo as normas de regulamentação da Associação Brasileira de Normas Técnicas (ABNT)', status: true },
      { item: 'XIX - colaborar com a conservação e a limpeza dos ambientes e com a preservação do patrimônio institucional', status: true },
    ])
  end
end
