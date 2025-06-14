import puppeteer from 'puppeteer';

/**
 * Simple check script to test master data pages for:
 * 1. Refresh buttons
 * 2. Scroll bars
 * 3. Back buttons
 */

async function checkMasterDataPages() {
  console.log('Starting test for master data pages...');
  
  const browser = await puppeteer.launch({
    headless: 'new',
    args: ['--no-sandbox', '--disable-setuid-sandbox']
  });
  
  try {
    const page = await browser.newPage();
    
    // Pages to test
    const pagesToTest = [
      { path: '/master-data/asset-master', name: 'Asset Master' },
      { path: '/master-data/cost-centers', name: 'Cost Centers' }
    ];
    
    const results = [];
    
    // Test each page
    for (const testPage of pagesToTest) {
      console.log(`Testing ${testPage.name}...`);
      try {
        await page.goto(`http://localhost:5000${testPage.path}`, { waitUntil: 'networkidle0', timeout: 10000 });
        
        // Take a screenshot
        await page.screenshot({ path: `./tests/screenshots/${testPage.name.replace(/\s+/g, '-').toLowerCase()}.png` });
        
        // Check for refresh button
        const hasRefreshButton = await page.evaluate(() => {
          const refreshButtons = Array.from(document.querySelectorAll('button')).filter(button => {
            const buttonText = button.textContent.toLowerCase();
            const hasRefreshIcon = button.innerHTML.includes('refresh') || 
                                   button.innerHTML.includes('rotate') || 
                                   button.querySelector('svg[data-icon="refresh"]');
            return buttonText.includes('refresh') || hasRefreshIcon;
          });
          return refreshButtons.length > 0;
        });
        
        // Check for scrollbars in tables
        const hasScrollbars = await page.evaluate(() => {
          const scrollContainers = document.querySelectorAll('div[style*="overflow"]');
          if (scrollContainers.length === 0) return false;
          
          for (const container of scrollContainers) {
            if (
              container.style.overflowY === 'auto' || 
              container.style.overflow.includes('auto') ||
              container.scrollHeight > container.clientHeight
            ) {
              return true;
            }
          }
          
          return false;
        });
        
        // Check for back button
        const hasBackButton = await page.evaluate(() => {
          const backElements = [
            ...Array.from(document.querySelectorAll('a')).filter(a => 
              a.textContent.toLowerCase().includes('back') || 
              a.innerHTML.includes('arrow-left')
            ),
            ...Array.from(document.querySelectorAll('button')).filter(button => 
              button.textContent.toLowerCase().includes('back') || 
              button.innerHTML.includes('arrow-left')
            )
          ];
          return backElements.length > 0;
        });
        
        results.push({
          page: testPage.name,
          hasRefreshButton,
          hasScrollbars,
          hasBackButton,
          status: 'Success'
        });
        
      } catch (error) {
        console.error(`Error testing ${testPage.name}:`, error);
        results.push({
          page: testPage.name,
          hasRefreshButton: false,
          hasScrollbars: false,
          hasBackButton: false,
          status: 'Error',
          error: error.message
        });
      }
    }
    
    // Generate a simple HTML report
    const reportHTML = `
    <!DOCTYPE html>
    <html>
      <head>
        <title>Master Data Test Report</title>
        <style>
          body { font-family: Arial, sans-serif; line-height: 1.6; max-width: 800px; margin: 0 auto; padding: 20px; }
          h1 { color: #2c3e50; text-align: center; }
          table { width: 100%; border-collapse: collapse; margin: 20px 0; }
          th, td { padding: 10px; border: 1px solid #ddd; text-align: left; }
          th { background-color: #f2f2f2; }
          .success { color: green; }
          .error { color: red; }
          .pass { background-color: #e6ffe6; }
          .fail { background-color: #ffe6e6; }
          img { max-width: 100%; height: auto; border: 1px solid #ddd; margin-top: 10px; }
        </style>
      </head>
      <body>
        <h1>Master Data Test Report</h1>
        <p>Test run at: ${new Date().toLocaleString()}</p>
        
        <table>
          <tr>
            <th>Page</th>
            <th>Refresh Button</th>
            <th>Scrollbars</th>
            <th>Back Button</th>
            <th>Status</th>
          </tr>
          ${results.map(result => `
            <tr>
              <td>${result.page}</td>
              <td class="${result.hasRefreshButton ? 'pass' : 'fail'}">${result.hasRefreshButton ? '✓' : '✗'}</td>
              <td class="${result.hasScrollbars ? 'pass' : 'fail'}">${result.hasScrollbars ? '✓' : '✗'}</td>
              <td class="${result.hasBackButton ? 'pass' : 'fail'}">${result.hasBackButton ? '✓' : '✗'}</td>
              <td class="${result.status === 'Success' ? 'success' : 'error'}">${result.status}</td>
            </tr>
          `).join('')}
        </table>
        
        <h2>Screenshots</h2>
        ${results.map(result => `
          <div>
            <h3>${result.page}</h3>
            <img src="./screenshots/${result.page.replace(/\s+/g, '-').toLowerCase()}.png" alt="${result.page} screenshot">
          </div>
        `).join('')}
      </body>
    </html>
    `;
    
    // Write the report to file
    const fs = await import('fs');
    fs.writeFileSync('./tests/reports/master-data-test-report.html', reportHTML);
    
    console.log('Test completed. Report saved to ./tests/reports/master-data-test-report.html');
    console.log('\nSummary:');
    results.forEach(result => {
      console.log(`${result.page}:`);
      console.log(`  - Refresh Button: ${result.hasRefreshButton ? '✓' : '✗'}`);
      console.log(`  - Scrollbars: ${result.hasScrollbars ? '✓' : '✗'}`);
      console.log(`  - Back Button: ${result.hasBackButton ? '✓' : '✗'}`);
      console.log(`  - Status: ${result.status}`);
    });
    
  } finally {
    await browser.close();
  }
}

// Run the tests
checkMasterDataPages().catch(console.error);