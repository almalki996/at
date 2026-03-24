require('dotenv').config({ path: '.env' });
const token = process.env.NEXT_PUBLIC_DIRECTUS_TOKEN;

async function patchIdSpecial(collection) {
  const url = `http://127.0.0.1:3012/fields/${collection}/id`;
  const patchRes = await fetch(url, {
    method: 'PATCH',
    headers: { "Authorization": `Bearer ${token}`, "Content-Type": "application/json" },
    body: JSON.stringify({ meta: { special: ["uuid"] } })
  });
  if (patchRes.ok) {
    console.log(`Successfully patched ID for ${collection}`);
  } else {
    console.error(`Failed patching ID for ${collection}`, await patchRes.text());
  }
}

async function run() {
  const collections = [
    'strategic_plans', 
    'strategic_objectives', 
    'operational_objectives', 
    'kpis', 
    'initiatives', 
    'implementation_mechanisms'
  ];
  for (const c of collections) {
    await patchIdSpecial(c);
  }
}
run();
