# React

## Basics

- React apps are made out of **components**.
- A component is a piece of the **UI (User Interface)** that has its own logic and appearance.
- A component can be as **small** as a button, or as **large** as an entire page.
- React components are **JavaScript functions** that return **markup**
- The components can be **nested** using it inside the **markup**.
- The `export default` keywords specify the **main component** in the file.

```js
function MyButton() {
  return <button>I'm a button</button>;
}

export default function MyApp() {
  return (
    <div>
      <h1>Welcome to my app</h1>
      <MyButton />
    </div>
  );
}
```

- JSX its the markup syntax used:
  - It is stricter than HTML
  - All the tags must be closed
  - The component can only return one JSX tag

### Styles

## Coding

It can be done using vite

```shell
npm create vite
cd new-folder-created
npm i
npm run dev
# http://localhost:5173
```
