import React, { useState } from 'react';

function Pagination() {
  const items = Array.from({ length: 100 }, (_, index) => `Item ${index + 1}`);
  const itemsPerPage = 10;

  const [currentPage, setCurrentPage] = useState(1);
  
  // Calculate the range of items to display
  const indexOfLastItem = currentPage * itemsPerPage;
  const indexOfFirstItem = indexOfLastItem - itemsPerPage;
  const currentItems = items.slice(indexOfFirstItem, indexOfLastItem);

  // Calculate the total number of pages
  const totalPages = Math.ceil(items.length / itemsPerPage);

  const paginate = (pageNumber) => setCurrentPage(pageNumber);

  return (
    <div>
      {/* Display current items */}
      <ul className="space-y-2">
        {currentItems.map((item, index) => (
          <li key={index} className="p-3 border rounded-md shadow hover:bg-gray-100 transition">
            {item}
          </li>
        ))}
      </ul>

      {/* Pagination controls */}
      <div className="flex justify-center mt-6">
        <button 
          onClick={() => paginate(currentPage - 1)} 
          disabled={currentPage === 1}
          className="px-4 py-2 border rounded-md bg-gray-200 hover:bg-gray-300 disabled:bg-gray-300 transition"
        >
          Prev
        </button>

        <span className="mx-4 text-lg">Page {currentPage} of {totalPages}</span>

        <button 
          onClick={() => paginate(currentPage + 1)} 
          disabled={currentPage === totalPages}
          className="px-4 py-2 border rounded-md bg-gray-200 hover:bg-gray-300 disabled:bg-gray-300 transition"
        >
          Next
        </button>
      </div>
    </div>
  );
}

export default Pagination;
