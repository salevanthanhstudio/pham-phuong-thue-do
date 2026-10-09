-- Chạy trong Supabase > SQL Editor.
-- Quyền cho tài khoản đã đăng nhập. Tất cả tài khoản được phép cùng quản lý dữ liệu.
alter table public.customers enable row level security;
alter table public.items enable row level security;
alter table public.orders enable row level security;
alter table public.finance enable row level security;
drop policy if exists "customers_authenticated" on public.customers;
drop policy if exists "items_authenticated" on public.items;
drop policy if exists "orders_authenticated" on public.orders;
drop policy if exists "finance_authenticated" on public.finance;
create policy "customers_authenticated" on public.customers for all to authenticated using (true) with check (true);
create policy "items_authenticated" on public.items for all to authenticated using (true) with check (true);
create policy "orders_authenticated" on public.orders for all to authenticated using (true) with check (true);
create policy "finance_authenticated" on public.finance for all to authenticated using (true) with check (true);
grant usage on schema public to authenticated;
grant select, insert, update, delete on public.customers, public.items, public.orders, public.finance to authenticated;
