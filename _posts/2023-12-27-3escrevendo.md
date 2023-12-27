---
title: Escrevendo um novo post
author: cotes
date: 2019-08-08 14:10:00 +0800
categories: [Blogging, Tutorial]
tags: [writing]
render_with_liquid: false
---
Este tutorial irá orientá-lo sobre como escrever um post no modelo _Chirpy_, e vale a pena ler mesmo se você já usou o Jekyll antes, pois muitos recursos requerem a configuração de variáveis específicas.

## Nome e Caminho

Crie um novo arquivo com o nome `AAAA-MM-DD-TITULO.EXTENSAO`{: .filepath} e coloque-o na pasta `_posts`{: .filepath} do diretório raiz. Observe que a `EXTENSAO`{: .filepath} deve ser uma das seguintes: `md`{: .filepath} ou `markdown`{: .filepath}. Se você deseja economizar tempo na criação de arquivos, considere usar o plugin [`Jekyll-Compose`](https://github.com/jekyll/jekyll-compose) para fazer isso.

## Front Matter

Basicamente, você precisa preencher o [Front Matter](https://jekyllrb.com/docs/front-matter/) como abaixo no início do post:

```yaml
---
title: TITULO
date: AAAA-MM-DD HH:MM:SS +/-TTTT
categories: [CATEGORIA_PRINCIPAL, SUBCATEGORIA]
tags: [TAG]     # Os nomes das TAGs devem sempre estar em letras minúsculas
---
```

> O _layout_ dos posts foi definido como `post` por padrão, portanto, não há necessidade de adicionar a variável _layout_ no bloco do Front Matter.
{: .prompt-tip }

### Fuso Horário da Data

Para registrar com precisão a data de lançamento de um post, você deve configurar o `timezone` em `_config.yml`{: .filepath}, bem como fornecer o fuso horário do post na variável `date` do seu bloco de Front Matter. Formato: `+/-TTTT`, por exemplo, `+0800`.

### Categorias e Tags

As `categories` de cada post são projetadas para conter até dois elementos, e o número de elementos em `tags` pode ser de zero a infinito. Por exemplo:

```yaml
---
categories: [Animal, Inseto]
tags: [abelha]
---
```

### Informações do Autor

As informações do autor do post geralmente não precisam ser preenchidas no Front Matter, pois são obtidas das variáveis `social.name` e da primeira entrada de `social.links` do arquivo de configuração por padrão. No entanto, você também pode substituí-las da seguinte forma:

Adicione as informações do autor em `_data/authors.yml` (Se seu site não tiver esse arquivo, não hesite em criá-lo).

```yaml
<id_do_autor>:
  name: <nome_completo>
  twitter: <twitter_do_autor>
  url: <homepage_do_autor>
```
{: file="_data/authors.yml"}

E depois use `author` para especificar uma única entrada ou `authors` para especificar várias entradas:

```yaml
---
author: <id_do_autor>                     # para uma única entrada
# ou
authors: [<id_do_autor1>, <id_do_autor2>]   # para várias entradas
---
```

Dito isso, a chave `author` também pode identificar várias entradas.

> A vantagem de ler as informações do autor do arquivo `_data/authors.yml`{: .filepath } é que a página terá a meta tag `twitter:creator`, que enriquece os [Twitter Cards](https://developer.twitter.com/en/docs/twitter-for-websites/cards/guides/getting-started#card-and-content-attribution) e é bom para o SEO.
{: .prompt-info }

## Sumário

Por padrão, o **T**able **o**f **C**ontents (TOC) é exibido no painel direito do post. Se você deseja desativá-lo globalmente, vá para `_config.yml`{: .filepath} e defina o valor da variável `toc` como `false`. Se você deseja desativar o TOC para um post específico, adicione o seguinte ao [Front Matter](https://jekyllrb.com/docs/front-matter/) do post:

```yaml
---
toc: false
---
```

## Comentários

O interruptor global de comentários é definido pela variável `comments.active` no arquivo `_config.yml`{: .filepath}. Após selecionar um sistema de comentários para esta variável, os comentários serão ativados para todos os posts.

Se você deseja desativar os comentários para um post específico, adicione o seguinte ao **Front Matter** do post:

```yaml
---
comments: false
---
```

## Matemática

Por razões de desempenho do site, o recurso matemático não será carregado por padrão. Mas você pode habilitá-lo usando:

```yaml
---
math: true
---
```

Após habilitar o recurso matemático, você pode adicionar equações matemáticas com a seguinte sintaxe:

- **Matemática em bloco** deve ser adicionada com `$$ matemática $$` com linhas em branco **obrigatórias** antes e depois de `$$`
- **Matemática embutida** (em linhas) deve ser adicionada com `$$ matemática $$` sem linha em branco antes ou depois de `$$`
- **Matemática embutida** (em listas) deve ser adicionada com `\$$ matemática $$`

```markdown
<!-- Matemática em bloco, mantenha todas as linhas em branco -->

$$
Expressão_matemática_LaTeX
$$

<!-- Matemática embutida em linhas, NÃO mantenha linhas em branco -->

"Lorem ipsum dolor sit amet, $$ Expressão_matem

ática_LaTeX $$ consectetur adipiscing elit."

<!-- Matemática embutida em listas, escape o primeiro `$` -->

1. \$$ Expressão_matemática_LaTeX $$
2. \$$ Expressão_matemática_LaTeX $$
3. \$$ Expressão_matemática_LaTeX $$
```

## Mermaid

[**Mermaid**](https://github.com/mermaid-js/mermaid) é uma ótima ferramenta de geração de diagramas. Para ativá-lo em seu post, adicione o seguinte bloco YAML:

```yaml
---
mermaid: true
---
```

Então você pode usá-lo como em outras linguagens de marcação: cercando o código do gráfico com ```` ```mermaid ```` e ```` ``` ````.

## Imagens

### Legenda

Adicione itálico à linha seguinte a uma imagem e ela se tornará a legenda e aparecerá na parte inferior da imagem:

```markdown
![descrição-da-imagem](/caminho/para/imagem)
_Legenda da Imagem_
```
{: .nolineno}

### Tamanho

Para evitar que o layout do conteúdo da página seja alterado quando a imagem for carregada, você deve definir a largura e a altura para cada imagem.

```markdown
![Visualização Desktop](/assets/img/exemplo/mockup.png){: width="700" height="400" }
```
{: .nolineno}

> Para um arquivo SVG, você deve pelo menos especificar a _largura_, caso contrário, ele não será renderizado.
{: .prompt-info}

A partir do _Chirpy v5.0.0_, `height` e `width` suportam abreviações (`height` → `h`, `width` → `w`). O exemplo a seguir tem o mesmo efeito que o anterior:

```markdown
![Visualização Desktop](/assets/img/exemplo/mockup.png){: w="700" h="400" }
```
{: .nolineno}

### Posição

Por padrão, a imagem fica centralizada, mas você pode especificar a posição usando uma das classes `normal`, `left` e `right`.

> Uma vez que a posição seja especificada, a legenda da imagem não deve ser adicionada.
{: .prompt-warning}

- **Posição normal**

  A imagem ficará alinhada à esquerda no exemplo abaixo:

  ```markdown
  ![Visualização Desktop](/assets/img/exemplo/mockup.png){: .normal }
  ```
  {: .nolineno}

- **Alinhar à esquerda**

  ```markdown
  ![Visualização Desktop](/assets/img/exemplo/mockup.png){: .left }
  ```
  {: .nolineno}

- **Alinhar à direita**

  ```markdown
  ![Visualização Desktop](/assets/img/exemplo/mockup.png){: .right }
  ```
  {: .nolineno}

### Modo Escuro/Claro

Você pode fazer com que as imagens sigam as preferências de tema no modo escuro/claro. Isso requer que você prepare duas imagens, uma para o modo escuro e outra para o modo claro, e, em seguida, atribua a elas uma classe específica (`dark` ou `light`):

```markdown
![Apenas no modo claro](/caminho/para/imagem-no-modo-claro.png){: .light }
![Apenas no modo escuro](/caminho/para/imagem-no-modo-escuro.png){: .dark }
```

### Sombra

As capturas de tela da janela do programa podem ser usadas para mostrar o efeito de sombra:

```markdown
![Visualização Desktop](/assets/img/exemplo/mockup.png){: .shadow }
```
{: .nolineno}

### URL do CDN

Se você hospedar as imagens no CDN, pode economizar tempo escrevendo repetidamente a URL do CDN, atribuindo a variável `img_cdn` do arquivo `_config.yml`{: .filepath}:

```yaml
img_cdn: https://cdn.com
```
{: file='_config.yml' .nolineno}

Depois que `img_cdn` for atribuído, o prefixo CDN será adicionado ao caminho de todas as imagens (imagens do avatar do site e dos posts) que começam com `/`.

Por exemplo, ao usar imagens:

```markdown
![A flor](/caminho/para/flor.png)
```
{: .nolineno}

O resultado da análise automaticamente adicionará o prefixo CDN `https://cdn.com` antes do caminho da imagem:

```html
<img src="https://cdn.com/caminho/para/flor.png" alt="A flor">
```
{: .nolineno }

### Caminho da Imagem

Quando um post contém muitas imagens, pode ser uma tarefa demorada definir repetidamente o caminho das imagens. Para resolver isso, podemos definir esse caminho no bloco YAML do post:

```yml
---
img_path: /caminho/para/imagens/
---
```

E então, a origem da imagem em Markdown pode escrever o nome do arquivo diretamente:

```md
![A flor](flor.png)
```
{: .nolineno }

A saída será:

```html
<img src="/caminho/para/imagens/flor.png" alt="A flor">
```
{: .nolineno }

### Imagem de Visualização

Se você quiser adicionar uma imagem no topo do post, forneça uma imagem com uma resolução de `1200 x 630`. Observe que se a proporção da imagem não atender a `1.91 : 1`, a imagem será dimensionada e recortada.

Conhecendo esses pré-requisitos, você pode começar a configurar o atributo da imagem:

```yaml
---
image:
  path: /caminho/para/imagem
  alt: texto alternativo da imagem
---
```

Observe que o [`img_path`](#caminho-da-imagem) também pode ser usado na imagem de visualização, ou seja, quando ele foi definido, o atributo `path` só precisa do nome do arquivo da imagem.

Para uso simples, você também pode usar apenas `image` para definir o caminho.

```yml
---
image: /caminho/para/imagem
---
```

### LQIP

Para imagens de visualização:

```yaml
---
image:
  lqip: /caminho/para/arquivo-lqip # ou URI base64
---
```

> Você pode observar o LQIP na imagem de visualização do post [_Text and Typography_](/posts/text-and-typography/).

Para imagens normais:

```markdown
![Descrição da imagem](/caminho/para/imagem){: lqip="/caminho/para/arquivo-lqip" }
```
{: .nolineno }

## Posts Fixados

Você pode fixar um ou mais posts no topo da página inicial, e os posts fixos são ordenados em ordem reversa de acordo com sua data de lançamento. Ative da seguinte forma:

```yaml
---
pin: true
---
```

## Dicas

Existem vários tipos de dicas: `dica`, `informação`, `aviso` e `perigo`. Elas podem ser geradas adicionando a classe `prompt-{tipo}` ao bloco de citação. Por exemplo, defina uma dica do tipo `informação` da seguinte forma:

```md
> Linha de exemplo para dica.
{: .prompt-info }
```
{: .nolineno }

## Sintaxe

### Código em Linha

```md
`trecho de código em linha`
```
{: .nolineno }

### Destaque de Caminho do Arquivo

```md
`/caminho/para/um/arquivo.extensão`{: .filepath}
```
{: .nolineno }

### Bloco de Código

Os símbolos Markdown ```` ``` ```` podem criar facilmente um bloco de código da seguinte forma:

````md
```
Este é um trecho de código em texto simples.
```
````

#### Especificando a Linguagem

Usando ```` ```{linguagem} ```` você terá um bloco de código com destaque de sintaxe:

````markdown
```yaml
chave: valor
```
````

> A tag Jekyll `{% highlight %}` não é compatível com este tema.
{: .prompt-danger }

#### Número da Linha

Por padrão, todas as linguagens, exceto `plaintext`, `console` e `terminal`, mostrarão números de linha. Quando você quiser ocultar o número da linha de um bloco de código, adicione a classe `nolineno` a ele:

````markdown
```shell
echo 'Sem mais números de linha!'
```
{: .nolineno }
````

#### Especificando o Nome do Arquivo

Você pode ter notado que a linguagem do código será exibida no topo do bloco de código. Se você deseja substituí-la pelo nome do arquivo, pode adicionar o atributo `file` para fazer isso:

````markdown
```shell
# conteúdo
```
{: file="caminho/para/arquivo" }
````

#### Códigos Liquid

Se você deseja exibir o trecho de código **Liquid**, coloque o código Liquid entre `{% raw %}` e `{% endraw %}`:

````markdown
{% raw %}
```liquid
{% if product.title contains 'Pack' %}
  Este título do produto contém a palavra Pack.
{% endif %}
```
{% endraw %}
````

Ou adicione `render_with_liquid: false` (Requer Jekyll 4.0 ou superior) ao bloco YAML do post.

## Vídeos

Você pode incorporar um vídeo com a seguinte sintaxe:

```liquid
{% include embed/{Plataforma}.html id='{ID}' %}
```

Onde `Plataforma` é o nome da plataforma em minúsculas e `ID` é o ID do vídeo.

A tabela a seguir mostra como obter os dois parâmetros necessários em uma URL de vídeo fornecida, e você também pode conhecer as plataformas de vídeo atualmente suportadas.

| URL do Vídeo                                                                                          | Plataforma   | ID             |
| -------------------------------------------------------------------------------------------------- | ---------- | :------------- |
| [https://www.**youtube**.com/watch?v=**H-B46URT4mg**](https://www.youtube.com/watch?v=H-B46URT4mg) | `youtube`  | `H-B46URT4mg`  |
| [https://www.**twitch**.tv/videos/**1634779211**](https://www.twitch.tv/videos/1634779211)         | `twitch`   | `1634779211`   |
| [https://www.**bilibili**.com/video/**BV1Q44y1B7Wf**](https://www.bilibili.com/video/BV1Q44y1B7Wf) | `bilibili` | `BV1Q44y1B7Wf` |

## Saiba Mais

Para obter mais informações sobre os posts do Jekyll, visite a [Jekyll Docs: Posts](https://jekyllrb.com/docs/posts/).









---
# ENGLISH 👇
This tutorial will guide you how to write a post in the _Chirpy_ template, and it's worth reading even if you've used Jekyll before, as many features require specific variables to be set.

## Naming and Path

Create a new file named `YYYY-MM-DD-TITLE.EXTENSION`{: .filepath} and put it in the `_posts`{: .filepath} of the root directory. Please note that the `EXTENSION`{: .filepath} must be one of `md`{: .filepath} and `markdown`{: .filepath}. If you want to save time of creating files, please consider using the plugin [`Jekyll-Compose`](https://github.com/jekyll/jekyll-compose) to accomplish this.

## Front Matter

Basically, you need to fill the [Front Matter](https://jekyllrb.com/docs/front-matter/) as below at the top of the post:

```yaml
---
title: TITLE
date: YYYY-MM-DD HH:MM:SS +/-TTTT
categories: [TOP_CATEGORIE, SUB_CATEGORIE]
tags: [TAG]     # TAG names should always be lowercase
---
```

> The posts' _layout_ has been set to `post` by default, so there is no need to add the variable _layout_ in the Front Matter block.
{: .prompt-tip }

### Timezone of Date

In order to accurately record the release date of a post, you should not only set up the `timezone` of `_config.yml`{: .filepath} but also provide the post's timezone in variable `date` of its Front Matter block. Format: `+/-TTTT`, e.g. `+0800`.

### Categories and Tags

The `categories` of each post are designed to contain up to two elements, and the number of elements in `tags` can be zero to infinity. For instance:

```yaml
---
categories: [Animal, Insect]
tags: [bee]
---
```

### Author Information

The author information of the post usually does not need to be filled in the _Front Matter_ , they will be obtained from variables `social.name` and the first entry of `social.links` of the configuration file by default. But you can also override it as follows:

Adding author information in `_data/authors.yml` (If your website doesn't have this file, don't hesitate to create one).

```yaml
<author_id>:
  name: <full name>
  twitter: <twitter_of_author>
  url: <homepage_of_author>
```
{: file="_data/authors.yml" }


And then use `author` to specify a single entry or `authors` to specify multiple entries:

```yaml
---
author: <author_id>                     # for single entry
# or
authors: [<author1_id>, <author2_id>]   # for multiple entries
---
```


Having said that, the key `author` can also identify multiple entries.

> The benefit of reading the author information from the file `_data/authors.yml`{: .filepath } is that the page will have the meta tag `twitter:creator`, which enriches the [Twitter Cards](https://developer.twitter.com/en/docs/twitter-for-websites/cards/guides/getting-started#card-and-content-attribution) and is good for SEO.
{: .prompt-info }

## Table of Contents

By default, the **T**able **o**f **C**ontents (TOC) is displayed on the right panel of the post. If you want to turn it off globally, go to `_config.yml`{: .filepath} and set the value of variable `toc` to `false`. If you want to turn off TOC for a specific post, add the following to the post's [Front Matter](https://jekyllrb.com/docs/front-matter/):

```yaml
---
toc: false
---
```

## Comments

The global switch of comments is defined by variable `comments.active` in the file `_config.yml`{: .filepath}. After selecting a comment system for this variable, comments will be turned on for all posts.

If you want to close the comment for a specific post, add the following to the **Front Matter** of the post:

```yaml
---
comments: false
---
```

## Mathematics

For website performance reasons, the mathematical feature won't be loaded by default. But it can be enabled by:

```yaml
---
math: true
---
```

After enabling the mathematical feature, you can add math equations with the following syntax: 

- **Block math** should be added with `$$ math $$` with **mandatory** blank lines before and after `$$`
- **Inline math** (in lines) should be added with `$$ math $$` without any blank line before or after `$$`
- **Inline math** (in lists) should be added with `\$$ math $$`

```markdown
<!-- Block math, keep all blank lines -->

$$
LaTeX_math_expression
$$

<!-- Inline math in lines, NO blank lines -->

"Lorem ipsum dolor sit amet, $$ LaTeX_math_expression $$ consectetur adipiscing elit."

<!-- Inline math in lists, escape the first `$` -->

1. \$$ LaTeX_math_expression $$
2. \$$ LaTeX_math_expression $$
3. \$$ LaTeX_math_expression $$
```

## Mermaid

[**Mermaid**](https://github.com/mermaid-js/mermaid) is a great diagram generation tool. To enable it on your post, add the following to the YAML block:

```yaml
---
mermaid: true
---
```

Then you can use it like other markdown languages: surround the graph code with ```` ```mermaid ```` and ```` ``` ````.

## Images

### Caption

Add italics to the next line of an image, then it will become the caption and appear at the bottom of the image:

```markdown
![img-description](/path/to/image)
_Image Caption_
```
{: .nolineno}

### Size

In order to prevent the page content layout from shifting when the image is loaded, we should set the width and height for each image.

```markdown
![Desktop View](/assets/img/sample/mockup.png){: width="700" height="400" }
```
{: .nolineno}

> For an SVG, you have to at least specify its _width_, otherwise it won't be rendered.
{: .prompt-info }

Starting from _Chirpy v5.0.0_, `height` and `width` support abbreviations (`height` → `h`, `width` → `w`). The following example has the same effect as the above:

```markdown
![Desktop View](/assets/img/sample/mockup.png){: w="700" h="400" }
```
{: .nolineno}

### Position

By default, the image is centered, but you can specify the position by using one of the classes `normal`, `left`, and `right`.

> Once the position is specified, the image caption should not be added.
{: .prompt-warning }

- **Normal position**

  Image will be left aligned in below sample:

  ```markdown
  ![Desktop View](/assets/img/sample/mockup.png){: .normal }
  ```
  {: .nolineno}

- **Float to the left**

  ```markdown
  ![Desktop View](/assets/img/sample/mockup.png){: .left }
  ```
  {: .nolineno}

- **Float to the right**

  ```markdown
  ![Desktop View](/assets/img/sample/mockup.png){: .right }
  ```
  {: .nolineno}

### Dark/Light mode

You can make images follow theme preferences in dark/light mode. This requires you to prepare two images, one for dark mode and one for light mode, and then assign them a specific class (`dark` or `light`):

```markdown
![Light mode only](/path/to/light-mode.png){: .light }
![Dark mode only](/path/to/dark-mode.png){: .dark }
```

### Shadow

The screenshots of the program window can be considered to show the shadow effect:

```markdown
![Desktop View](/assets/img/sample/mockup.png){: .shadow }
```
{: .nolineno}

### CDN URL

If you host the images on the CDN, you can save the time of repeatedly writing the CDN URL by assigning the variable `img_cdn` of `_config.yml`{: .filepath} file:

```yaml
img_cdn: https://cdn.com
```
{: file='_config.yml' .nolineno}

Once `img_cdn` is assigned, the CDN URL will be added to the path of all images (images of site avatar and posts) starting with `/`.

For instance, when using images:

```markdown
![The flower](/path/to/flower.png)
```
{: .nolineno}

The parsing result will automatically add the CDN prefix `https://cdn.com` before the image path:

```html
<img src="https://cdn.com/path/to/flower.png" alt="The flower">
```
{: .nolineno }

### Image Path

When a post contains many images, it will be a time-consuming task to repeatedly define the path of the images. To solve this, we can define this path in the YAML block of the post:

```yml
---
img_path: /img/path/
---
```

And then, the image source of Markdown can write the file name directly:

```md
![The flower](flower.png)
```
{: .nolineno }

The output will be:

```html
<img src="/img/path/flower.png" alt="The flower">
```
{: .nolineno }

### Preview Image

If you want to add an image at the top of the post, please provide an image with a resolution of `1200 x 630`. Please note that if the image aspect ratio does not meet `1.91 : 1`, the image will be scaled and cropped.

Knowing these prerequisites, you can start setting the image's attribute:

```yaml
---
image:
  path: /path/to/image
  alt: image alternative text
---
```

Note that the [`img_path`](#image-path) can also be passed to the preview image, that is, when it has been set, the  attribute `path` only needs the image file name.

For simple use, you can also just use `image` to define the path.

```yml
---
image: /path/to/image
---
```

### LQIP

For preview images:

```yaml
---
image:
  lqip: /path/to/lqip-file # or base64 URI
---
```

> You can observe LQIP in the preview image of post [_Text and Typography_](/posts/text-and-typography/).


For normal images:

```markdown
![Image description](/path/to/image){: lqip="/path/to/lqip-file" }
```
{: .nolineno }

## Pinned Posts

You can pin one or more posts to the top of the home page, and the fixed posts are sorted in reverse order according to their release date. Enable by:

```yaml
---
pin: true
---
```

## Prompts

There are several types of prompts: `tip`, `info`, `warning`, and `danger`. They can be generated by adding the class `prompt-{type}` to the blockquote. For example, define a prompt of type `info` as follows:

```md
> Example line for prompt.
{: .prompt-info }
```
{: .nolineno }

## Syntax

### Inline Code

```md
`inline code part`
```
{: .nolineno }

### Filepath Hightlight

```md
`/path/to/a/file.extend`{: .filepath}
```
{: .nolineno }

### Code Block

Markdown symbols ```` ``` ```` can easily create a code block as follows:

````md
```
This is a plaintext code snippet.
```
````

#### Specifying Language

Using ```` ```{language} ```` you will get a code block with syntax highlight:

````markdown
```yaml
key: value
```
````

> The Jekyll tag `{% highlight %}` is not compatible with this theme.
{: .prompt-danger }

#### Line Number

By default, all languages except `plaintext`, `console`, and `terminal` will display line numbers. When you want to hide the line number of a code block, add the class `nolineno` to it:

````markdown
```shell
echo 'No more line numbers!'
```
{: .nolineno }
````

#### Specifying the Filename

You may have noticed that the code language will be displayed at the top of the code block. If you want to replace it with the file name, you can add the attribute `file` to achieve this:

````markdown
```shell
# content
```
{: file="path/to/file" }
````

#### Liquid Codes

If you want to display the **Liquid** snippet, surround the liquid code with `{% raw %}` and `{% endraw %}`:

````markdown
{% raw %}
```liquid
{% if product.title contains 'Pack' %}
  This product's title contains the word Pack.
{% endif %}
```
{% endraw %}
````

Or adding `render_with_liquid: false` (Requires Jekyll 4.0 or higher) to the post's YAML block.

## Videos

You can embed a video with the following syntax:

```liquid
{% include embed/{Platform}.html id='{ID}' %}
```
Where `Platform` is the lowercase of the platform name, and `ID` is the video ID.

The following table shows how to get the two parameters we need in a given video URL, and you can also know the currently supported video platforms.

| Video URL                                                                                          | Platform   | ID             |
| -------------------------------------------------------------------------------------------------- | ---------- | :------------- |
| [https://www.**youtube**.com/watch?v=**H-B46URT4mg**](https://www.youtube.com/watch?v=H-B46URT4mg) | `youtube`  | `H-B46URT4mg`  |
| [https://www.**twitch**.tv/videos/**1634779211**](https://www.twitch.tv/videos/1634779211)         | `twitch`   | `1634779211`   |
| [https://www.**bilibili**.com/video/**BV1Q44y1B7Wf**](https://www.bilibili.com/video/BV1Q44y1B7Wf) | `bilibili` | `BV1Q44y1B7Wf` |

## Learn More

For more knowledge about Jekyll posts, visit the [Jekyll Docs: Posts](https://jekyllrb.com/docs/posts/).
