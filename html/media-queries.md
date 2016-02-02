# Media Queries
CSS media queries are allow for styling of element based on the size and type of the device. This is most commonly used for responsive web design, but can also be used for things like printers.

The basic syntax is:

```css
@media (device condition) {
  /* CSS for selected device */
}
```

For responsive design it's typical to use the `min-width` and `max-width` conditions to create style for specific screen sizes.

```css
@media (max-width: 768px) { /* Everything below iPad portrait */
  body {
    background-color: #fff;
  }
}

@media (min-width: 768px) and (max-width: 1024px) { /* iPad portraits to landscape */
  body {
    background-color: #777;
  }
}

@media (min-width: 1024px) { /* Everything above iPad */
  body {
    background-color: #000;
  }
}
```

Bourbon
--------

To make bourbon responsive, media queries are used in combination with the `span-columns` mixin.

```css
@media (max-width: 768px) { /* Everything below iPad portrait */
  .some-div {
    @include span-columns(12);
    @include omega();
  }
}

@media (min-width: 768px) and (max-width: 1024px) { /* iPad portraits to landscape */
  .some-div {
    @include span-columns(6);
    @include omega(2n);
  }
}

@media (min-width: 1024px) { /* Everything above iPad */
  .some-div {
    @include span-columns(4);
    @include omega(3n);
  }
}

```
