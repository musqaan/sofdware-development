import React from 'react';

function ThemeToggle({ toggleTheme }) {
  return (
    <div className="flex justify-center mb-6">
      <button 
        onClick={toggleTheme} 
        className="px-6 py-2 bg-blue-500 text-white rounded-lg hover:bg-blue-600 transition"
      >
        Toggle Theme
      </button>
    </div>
  );
}

export default ThemeToggle;
