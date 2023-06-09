// Código JavaScript para manipulação dinâmica da lista de recomendações
window.addEventListener('DOMContentLoaded', function() {
  // Seletor para a div container das recomendações
  var container = document.querySelector('.container');

  // Array de recomendações
  var recommendations = [
    { title: 'Recommendation 1', description: 'Description 1', link: '#' },
    { title: 'Recommendation 2', description: 'Description 2', link: '#' },
    { title: 'Recommendation 3', description: 'Description 3', link: '#' },
    { title: 'Recommendation 4', description: 'Description 4', link: '#' },
    // Adicione mais recomendações aqui
  ];

  // Função para exibir as recomendações na página
  function displayRecommendations() {
    for (var i = 0; i < recommendations.length; i++) {
      var recommendation = recommendations[i];

      var listItem = document.createElement('div');
      listItem.className = 'list-item';

      var title = document.createElement('h2');
      title.className = 'item-title';
      title.textContent = recommendation.title;

      var description = document.createElement('p');
      description.className = 'item-description';
      description.textContent = recommendation.description;

      var link = document.createElement('a');
      link.className = 'item-link';
      link.href = recommendation.link;
      link.textContent = 'Link';

      listItem.appendChild(title);
      listItem.appendChild(description);
      listItem.appendChild(link);

      container.appendChild(listItem);
    }
  }

  // Chamada da função para exibir as recomendações
  displayRecommendations();
});
