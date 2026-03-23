const url = 'http://127.0.0.1:3012';
const token = 'strategic_plans_super_secure_admin_token';
const headers = {
    'Authorization': `Bearer ${token}`,
    'Content-Type': 'application/json'
};

async function checkFields() {
    try {
        for (const col of ['Structures', 'Departments', 'Personnel']) {
            const res = await fetch(`${url}/fields/${col}`, { headers });
            const data = await res.json();
            const idField = data.data.find(f => f.field === 'id');
            console.log(col, idField?.type);
        }
    } catch (e) {
        console.error(e);
    }
}

checkFields();
