# Haml

http://haml.info/

Beautiful, DRY, well-indented, clear markup: templating haiku.

```erb
<section class="container">
    <h1><%= post.title></h1>
    <h2><%= post.subtitle></h2>
    <div class="content">
        <%= post.content %>
    </div>
</section>
```

```haml
%section.container
    %h1= post.title
    %h2= post.subtitle
    .content
        = post.content
```

## What is it?

Haml(HTML abstraction markup language) is based on one primary principle: markup should be beautiful. It's not just beauty for beauty's sake either; Haml accelerates and simplifies template creation down to veritable haiku.

> **veritable**: You can use veritable to emphasize the size, amount, or nature of something.
> **haiku**: A haiku is a short poem consisting of words with a total of seventeen syllables, arranged on three lines.

Give yourself 5 minutes to read the [tutorial](haml_tutorial.md) and then convert one of your ERB templates to Haml. Simplify. Enjoy. Laugh. 20 minutes later, you will never go back.