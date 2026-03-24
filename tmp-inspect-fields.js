const axios = require('axios');
async function inspectFields() {
  const token = "x_2tYIfiM262Z9rE35Yc9O_hUe8pL3nB";
  const url = "http://127.0.0.1:3012/fields";
  const cols = ['strategic_plans', 'strategic_objectives', 'operational_objectives', 'kpis', 'initiatives', 'implementation_mechanisms'];
  const res = await axios.get(url, { headers: { Authorization: `Bearer ${token}` } });
  
  for (const col of cols) {
    const fields = res.data.data.filter(f => f.collection === col && !['id','sort','user_created','date_created','user_updated','date_updated'].includes(f.field));
    console.log(`\n--- ${col} ---`);
    fields.forEach(f => {
      console.log(`${f.field} (Type: ${f.type})`);
    });
  }
}
inspectFields().catch(console.error);
