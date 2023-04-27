# 1. useState: This hook allows you to add state to a functional component.

# 2. useEffect: This hook allows you to perform side effects in a functional component, such as fetching data or manipulating the DOM.

# 3. useContext: This hook allows you to access context data from a functional component.

# 4. useReducer: This hook allows you to manage state in a more complex way, similar to the way you would with Redux.

# 5. useCallback: This hook allows you to memoize a function so that it is not re-created on every render.

# 6. useMemo: This hook allows you to memoize a value so that it is not re-computed on every render.

# 7. useRef: This hook allows you to create a mutable reference to a value that persists across renders.

# 8. useLayoutEffect: This hook is similar to useEffect, but it runs synchronously after all DOM mutations have been applied.

# 9. useImperativeHandle: This hook allows you to customize the instance value that is exposed by a parent component to its child component.

# 10. useDebugValue: This hook allows you to display a label for custom hooks in React DevTools.

# 11. diff between useEffect and useMemo and useEffect and useCALL BACK
useEffect and useMemo are both React hooks, but they serve different purposes. useEffect is used to perform side effects, such as fetching data or manipulating the DOM, while useMemo is used to memoize a value so that it is not re-computed on every render.

Here are some differences between useEffect and useMemo:

useEffect is used to run side effects in a component, such as fetching data from an API or manipulating the DOM. useMemo is used to memoize a value so that it is not re-computed on every render.

useEffect runs after every render, while useMemo only re-computes the memoized value when its dependencies change.

useEffect can return a cleanup function to handle any necessary clean-up after the side effect is completed. useMemo does not have a cleanup function.

useEffect and useCallback are also both React hooks, but they serve different purposes. useEffect is used to perform side effects, while useCallback is used to memoize a function so that it is not re-created on every render.

Here are some differences between useEffect and useCallback:

useEffect is used to run side effects in a component, while useCallback is used to memoize a function so that it is not re-created on every render.

useEffect runs after every render, while useCallback only re-creates the memoized function when its dependencies change.

useEffect can return a cleanup function to handle any necessary clean-up after the side effect is completed. useCallback does not have a cleanup function.

useCallback is typically used when passing a function down to a child component, to prevent unnecessary re-renders of the child component when the parent component re-renders.