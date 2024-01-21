import React from 'react';
import { createRoot } from 'react-dom/client';
import App from './App';

// Create a root instance
const root = createRoot(document.getElementById('root'));

// Render the application using the root instance
root.render(<App />);
