import { 
    createDirectus, 
    rest, 
    authentication,
    staticToken, 
    createCollection, 
    createField, 
    createRelation,
    readUsers,
    updateUser
} from '@directus/sdk';
import 'dotenv/config';

// Initialize the Directus Composables Client
const DIRECTUS_URL = process.env.DIRECTUS_URL || 'http://localhost:8055';

let client: any = createDirectus(DIRECTUS_URL)
    .with(authentication())
    .with(rest());

async function provisionSchema() {
    try {
        console.log('🔐 Authenticating with Admin Credentials...');
        await client.login({ email: 'admin@example.com', password: 'password' });
        
        console.log('🔑 Enforcing Admin Token via SDK...');
        const adminUsers = await client.request(readUsers({ filter: { email: { _eq: 'admin@example.com' } } }));
        if (adminUsers.length > 0) {
            await client.request(updateUser(adminUsers[0].id, { token: process.env.DIRECTUS_ADMIN_TOKEN }));
            console.log('✅ Admin Token configured successfully');
        }

        // Re-initialize to automatically attach static token header
        client = createDirectus(DIRECTUS_URL).with(staticToken(process.env.DIRECTUS_ADMIN_TOKEN!)).with(rest());

        console.log('🚀 Starting Automated Schema Provisioning...');

        // ------------------------------------------------------------------
        // STEP A: Create the Categories Collection
        // ------------------------------------------------------------------
        console.log('1️⃣ Creating "Categories" Collection...');
        await client.request(createCollection({
            collection: 'Categories',
            fields: [
                { field: 'id', type: 'integer', schema: { is_primary_key: true, has_auto_increment: true } },
                { field: 'name', type: 'string' },
                { field: 'description', type: 'text' },
            ],
        }));

        // Adjacency List: Self-referencing Many-to-One 'parent_id'
        console.log('   -> Adding self-referencing "parent_id"...');
        await client.request(createField('Categories', {
            field: 'parent_id',
            type: 'integer',
        }));
        await client.request(createRelation({
            collection: 'Categories',
            field: 'parent_id',
            related_collection: 'Categories',
            schema: { on_delete: 'SET NULL' }
        }));

        // ------------------------------------------------------------------
        // STEP B: Create the Jobs Collection
        // ------------------------------------------------------------------
        console.log('2️⃣ Creating "Jobs" Collection...');
        await client.request(createCollection({
            collection: 'Jobs',
            fields: [
                { field: 'id', type: 'integer', schema: { is_primary_key: true, has_auto_increment: true } },
                { field: 'job_title', type: 'string' },
                { field: 'job_type', type: 'string' },
            ],
        }));

        // ------------------------------------------------------------------
        // STEP C: Initialize the M2M Junction logic (Category_Jobs)
        // ------------------------------------------------------------------
        console.log('3️⃣ Creating Junction Collection "Category_Jobs"...');
        await client.request(createCollection({
            collection: 'Category_Jobs',
            meta: { hidden: true }, // Keep dashboard clean
            fields: [
                { field: 'id', type: 'integer', schema: { is_primary_key: true, has_auto_increment: true } },
                { field: 'Categories_id', type: 'integer' },
                { field: 'Jobs_id', type: 'integer' },
            ],
        }));

        console.log('   -> Wiring Junction relations and aliases...');
        
        await client.request(createField('Categories', {
            field: 'jobs',
            type: 'alias',
            meta: { interface: 'list-m2m', special: ['m2m'] }
        }));
        
        await client.request(createRelation({
            collection: 'Category_Jobs',
            field: 'Categories_id',
            related_collection: 'Categories',
            meta: {
                one_collection: 'Categories',
                one_field: 'jobs', 
                many_collection: 'Category_Jobs',
                many_field: 'Categories_id',
                junction_field: 'Jobs_id',
            },
            schema: { on_delete: 'CASCADE' }
        }));

        await client.request(createField('Jobs', {
            field: 'categories',
            type: 'alias',
            meta: { interface: 'list-m2m', special: ['m2m'] }
        }));
        
        await client.request(createRelation({
            collection: 'Category_Jobs',
            field: 'Jobs_id',
            related_collection: 'Jobs',
            meta: {
                one_collection: 'Jobs',
                one_field: 'categories',
                many_collection: 'Category_Jobs',
                many_field: 'Jobs_id',
                junction_field: 'Categories_id',
            },
            schema: { on_delete: 'CASCADE' }
        }));

        console.log('✅ Success! Directus schema is fully configured.');
    } catch (error: any) {
        console.error('❌ Automation Error:', error?.errors || error?.message || error);
    }
}

provisionSchema();
