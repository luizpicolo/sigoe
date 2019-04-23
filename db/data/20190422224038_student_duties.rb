class StudentDuties < SeedMigration::Migration
  def up
    Incident::StudentDuty.create!([
      {item: 'I - Participar, efetivamente, das atividades de ensino, objetivando o maior aproveitamento, mantendo respeito e atenção'},
      {item: 'II- Obedecer aos prazos estabelecidos nos regulamentos e calendário acadêmico'}, 
      {item: 'III - Ser assíduo e pontual, participando ativamente de todas as aulas e atividades acadêmicas'},
      {item: 'IV - Comparecer, quando convocado, às reuniões dos órgãos colegiados, diretoria, setores e coordenações, para conhecimento ou deliberação'},
      {item: 'V - Colaborar com a conservação, manutenção e limpeza do ambiente e patrimônio do IFMS'},
      {item: 'VI - Prestar informações aos responsáveis pela gestão escolar sobre atos que coloquem em risco a segurança dos estudantes, servidores, visitantes ou o patrimônio do IFMS'}, 
      {item: 'VII - Cumprir as normas específicas de acesso e permanência nas dependências, de utilização de equipamentos e de orientações sobre prevenção de acidente no IFMS'},
      {item: 'VIII - Estar sempre em posse do documento oficial de identificação estabelecido pelo campus, em bom estado de conservação, e utilizá-lo de forma adequada nas dependências do IFMS'},
      {item: 'IX - Participar, respeitosamente, das atividades curriculares e extracurriculares previstas no calendário acadêmico'},
      {item: 'X - Manter silêncio nas proximidades de salas de aula, laboratórios, bibliotecas e demais dependências durante a realização de atividades de ensino'},
      {item: 'XI - Responsabilizar-se pelos materiais escolares e pertences particulares trazidos para o IFMS'},
      {item: 'XII - Proceder de forma a não ferir a integridade física e moral das pessoas no âmbito do IFMS'},
      {item: 'XIII - Acompanhar as comunicações internas veiculadas nos quadros de avisos e informativos, assim como qualquer outro meio de comunicação oficial de que o campus dispuser'},
      {item: 'XIV - Manter atualizados os dados cadastrais na instituição'},
      {item: 'XV - Usar vestuário e calçados adequados às normas de segurança no trabalho, nas aulas de laboratório, aulas de campo, atividades de estágio e nas visitas técnicas, observadas as exigências do local de visitação'},
      {item: 'XVI - Zelar por todo e qualquer material didático disponibilizado pelo IFMS e devolvê-lo em bom estado de conservação'},
      {item: 'XVII - Respeitar a propriedade intelectual e cultural, seguindo as normas de regulamentação da Associação Brasileira de Normas Técnicas (ABNT)'},
      {item: 'XVIII- Respeitar colegas, servidores e terceirizados'},
      {item: 'XIX - Apresentar-se para as atividades de ensino devidamente trajado: camiseta, preferencialmente a oficial do IFMS, calça, bermuda ou saia, salvo em locais ou atividades que exijam um tipo de vestimenta específica, a exemplo das aulas de educação física, entre outros'}
    ])
  end
end