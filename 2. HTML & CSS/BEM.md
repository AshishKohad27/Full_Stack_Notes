Certainly! Here's an example of using the BEM (Block, Element, Modifier) naming convention in HTML and SCSS:

Let's say you're creating a card component that displays information about a product. The card has a title, description, and an optional "featured" state. Here's how you could structure your HTML and SCSS using BEM:

HTML Structure:

```htm
<div class="product-card">
  <h2 class="product-card__title">Product Title</h2>
  <p class="product-card__description">Product description goes here.</p>
  <div class="product-card__feature product-card__feature--highlighted">
    Featured
  </div>
</div>
```

In this example:

.product-card is the block.
.product-card**title and .product-card**description are elements within the block.
.product-card\_\_feature is an element, and --highlighted is a modifier indicating the featured state.

```scss
.product-card {
  background-color: #fff;
  border: 1px solid #ccc;
  padding: 20px;

  &__title {
    font-size: 18px;
    margin-bottom: 10px;
  }

  &\__description {
    font-size: 14px;
    color: #666;
  }

  &__feature {
    padding: 5px 10px;
    border-radius: 4px;

    &--highlighted {
      background-color: #ffcc00;
      color: #333;
    }
  }
}
```

In this SCSS:

- .product-card styles the entire card block.
- &**title and &**description styles the elements within the block.
- &\_\_feature styles the element, and &--highlighted styles the modifier for the featured state.

  This example showcases how BEM can help you create a clear and structured naming convention for your CSS classes, making your codebase more organized and maintainable. The separation of blocks, elements, and modifiers improves readability and makes it easier to manage complex styling requirements.
