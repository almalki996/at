const axios = require('axios');

async function checkRelations() {
  const token = "strategic_plans_super_secure_admin_token";
  const url = "http://127.0.0.1:3012";
  const api = axios.create({
    baseURL: url,
    headers: { Authorization: `Bearer ${token}` }
  });

  try {
    const res = await api.get('/relations');
    const rels = res.data.data.filter(r => [
      'strategic_plans', 'strategic_objectives', 'operational_objectives',
      'kpis', 'initiatives', 'implementation_mechanisms'
    ].includes(r.collection));
    
    console.log(JSON.stringify(rels, null, 2));
  } catch(e) { console.error(e.message); }
}

checkRelations();
