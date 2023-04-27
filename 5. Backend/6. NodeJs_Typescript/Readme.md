1. install npm
2. npm i typescript
3. to active typescript in node and express :- type decoration
   3.1 npm i @types/express
   3.2 npm i @types/node
4. import express,{Express,Response,Request} from "express";
5. npx tsc --init
6. outDir : "./dist"
7. npx tsc
8. node dist/index.js: run
9. npm i nodemon
10. automation of build ts file to js file
11. "dev": "npx tsc & nodemon dist/index.js" :- run both concurrently
