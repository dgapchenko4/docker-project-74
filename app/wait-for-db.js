const net = require('net');

const host = process.argv[2] || 'db';
const port = parseInt(process.argv[3]) || 5432;
const maxAttempts = 30;
let attempts = 0;

function wait() {
  const socket = net.connect(port, host, () => {
    console.log(`✅ Database ${host}:${port} is ready!`);
    socket.destroy();
    process.exit(0);
  });

  socket.on('error', () => {
    attempts++;
    process.stdout.write(`\r⏳ Waiting for database ${host}:${port}... (${attempts}/${maxAttempts})`);
    socket.destroy();
    
    if (attempts >= maxAttempts) {
      console.log(`\n❌ Database ${host}:${port} not available after ${maxAttempts} attempts`);
      process.exit(1);
    }
    
    setTimeout(wait, 2000);
  });
}

wait();
