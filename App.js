import React, { useState, useEffect } from 'react';
import ThemeToggle from './components/ThemeToggle';
import Pagination from './components/Pagination';
import './index.css'; // Tailwind imports

function App() {
  // Retrieve theme preference from localStorage
  const savedTheme = localStorage.getItem('theme') || 'light';
  const [theme, setTheme] = useState(savedTheme);

  // Update the document body class based on the theme
  useEffect(() => {
    document.body.className = theme;
    localStorage.setItem('theme', theme);
  }, [theme]);

  const toggleTheme = () => setTheme(theme === 'light' ? 'dark' : 'light');

  return (
    <div className={`min-h-screen ${theme === 'dark' ? 'bg-gray-900 text-white' : 'bg-white text-black'}`}>
      <div className="container mx-auto p-6">
        <h1 className="text-center text-3xl font-bold mb-6">Dark/Light Mode & Pagination</h1>
        <ThemeToggle toggleTheme={toggleTheme} />
        <Pagination />
      </div>
    </div>
  );
}

export default App;
