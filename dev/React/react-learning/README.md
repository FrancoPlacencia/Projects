This is a [Next.js](https://nextjs.org) project bootstrapped with [`create-next-app`](https://nextjs.org/docs/app/api-reference/cli/create-next-app).

## Getting Started

First, run the development server:

```bash
npm run dev
# or
yarn dev
# or
pnpm dev
# or
bun dev
```

## Typescript Configuration
Configure the VS with (Ctrl + Shift + P), TypeScript: Select TypeScript Version", and select the Workspace version.

## Base configuration
Add the baseUrl on the tsconfig.json
```json
{
  "compilerOptions": {
    ... 
    "baseUrl": "src/",
    "paths": {
      "@/styles/*": ["styles/*"],
      "@/components/*": ["components/*"]
    }
  }
}
```