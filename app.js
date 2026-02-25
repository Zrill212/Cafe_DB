const express = require('express');
const cors = require('cors');
const authRoutes = require("./routes/auth");
const app = express();
const PORT = 3000;

app.use(cors());
app.use(express.json());
app.use("/api/auth", authRoutes);


const menuRoutes = require('./routes/menuRoutes');
app.use('/api/menu', menuRoutes);

app.listen(PORT, () => {
  console.log(`Cafe API running di http://localhost:${PORT}`);
});