-- 公司午餐訂購系統資料表
create table if not exists public.employees (
  id uuid primary key default gen_random_uuid(),
  employee_no text unique not null,
  name text not null,
  department text not null default '',
  role text not null default 'employee' check (role in ('employee','admin')),
  created_at timestamptz not null default now()
);
create table if not exists public.menus (
  id uuid primary key default gen_random_uuid(),
  menu_date date not null,
  name text not null,
  description text not null default '',
  price numeric(10,2) not null default 0,
  stock integer not null default 999,
  created_at timestamptz not null default now()
);
create table if not exists public.orders (
  id uuid primary key default gen_random_uuid(),
  employee_no text not null references public.employees(employee_no),
  order_date date not null,
  menu_id uuid not null references public.menus(id),
  menu_name text not null,
  price numeric(10,2) not null,
  status text not null default 'confirmed' check (status in ('confirmed','cancelled')),
  created_at timestamptz not null default now(),
  unique(employee_no, order_date)
);
alter table public.employees enable row level security;
alter table public.menus enable row level security;
alter table public.orders enable row level security;
-- MVP policies for the employee-number prototype. For production, replace these with Supabase Auth policies.
create policy "prototype employees read" on public.employees for select using (true);
create policy "prototype menus read" on public.menus for select using (true);
create policy "prototype menus insert" on public.menus for insert with check (true);
create policy "prototype orders read" on public.orders for select using (true);
create policy "prototype orders insert" on public.orders for insert with check (true);
create policy "prototype orders update" on public.orders for update using (true) with check (true);
insert into public.employees(employee_no,name,department,role) values ('A001','王小明','業務部','employee'),('A002','陳小美','設計部','employee'),('admin','系統管理員','管理部','admin') on conflict (employee_no) do nothing;
