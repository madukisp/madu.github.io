---
layout: post
title: Comandos de Ruby para não esquecer
date: 2023-12-27 04:51 -0300
categories: [Blogging, Tutorial]
pin: true
---


### Executar o projeto
```ruby
bundle exec jekyll s
```

### Parar de rodar o servidor
```ruby
ctrl + c
```

### Criar novas postagens

Novo post
```ruby
bundle exec jekyll post "My New Post"
```

Rascunho
```ruby
bundle exec jekyll draft "My new draft"
ou
create-post.bat
```

Acessando o rascunho
```ruby
bundle exec jekyll serve --drafts
```

Publicar rascunho
```ruby
bundle exec jekyll publish _drafts/my-new-draft.md
```

Mover post para rascunho
```ruby
bundle exec jekyll unpublish _posts/2019-08-08-text-and-typography.md
```

## CSS

1. Se eu quiser alterar o css, eu tenho que alterar o arquivo '/assets/lib/fonts/main.css'.
