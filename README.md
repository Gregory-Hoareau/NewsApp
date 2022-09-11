L'application utilise 2 modèles de données différents : 
- ApiResult : C'est le modèle de donnée utilisé afin de convertir les données reçues via l'Api en données utilisable dans l'application
- News : C'est le modèle de donnée réprensentant un article

L'application est composée de 2 écrans principals : 
- NewsListView : C'est l'écran permettant de récupérer et afficher la liste des articles. L'affichage des éléments de la liste est fait par le fichier **NewsListItem**
- NewsDetail : C'est l'écran qui permet d'afficher les détails de l'article et d'accéder à l'article complet

Dans l'écran **NewsDetail**, on utilise une *ScrollView* afin que le lien permettant d'accéder à l'article complet reste visible en bas de l'écran même si le titre et la description de l'article sont trop long et dépasse de la taille de l'écran.

On utilise des *AsyncImage* afin d'afficher les différentes images des articles pour afficher une image de chargement tant que l'image n'est pas chargé ou si aucune image n'est disponible

L'application a était tester uniquement au format IPhone et pas au format IPad

## Points améliorables

- Lors de la récupération des articles via l'api, bien que l'url contienne le paramètre `language=fr`, les 2 premiers articles récupérés sont des articles en anglais.
Pour corriger ce problème, j'ai ajouter une ligne de code retirant les 2 premiers articles de la liste avant de les utiliser dans l'application. 

- La gestion de la réponse et des erreurs lors de la réception de la réponse à la requête est très simpliste et pourrait donc être amélioré afin de pouvoir différencier les différentes erreurs possible (timeout, erreur dans l'url, etc.) et afficher des messages plus pertinent que le message actuel présenter si aucun article n'est chargé.

-Tout le développement de l'application à directement était fait sur la branche principale, alors qu'idéalement différentes branches aurait du être créer pour l'implémentation des différentes fonctionnalités

